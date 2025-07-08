+++
title = "Wildcard Domains for Local Development with Dnsmasq"
date = "2025-07-08"
tags = [
    "linux",
    "ubuntu",
    "fedora",
    "dnsmasq",
    "DNS",
]
categories = [
    "linux",
]
+++

Are you tired of constantly editing your `/etc/hosts` file for every new project? Do you want to use clean, convenient local domains like `project-one.app.loc` or `api.my-app.app.loc` without having to define each one manually?

`Dnsmasq` is a lightweight DNS server that is perfect for this task. It allows you to set up **wildcard domains** (e.g., `*.app.loc`), where any subdomain will automatically point to your local machine.

In this guide, we will walk through setting up `dnsmasq` on modern Linux distributions like Ubuntu 24.04 and Fedora 42, resolve the common conflict with the default `systemd-resolved` service, and achieve a powerful and convenient local development environment.
<!--more-->

### Step 1: Install Dnsmasq

Let's start by installing the package from the standard repositories.

```bash
# On Ubuntu/Debian-based systems
sudo apt -y install dnsmasq

# On Fedora/CentOS/RHEL-based systems
sudo dnf -y install dnsmasq
```

### Step 2: Configure Dnsmasq

Now for the fun part—the configuration. We'll tell `dnsmasq` how to handle our local domains and where to forward all other requests.

Open the configuration file using your favorite editor (we'll use `nano` here):

```bash
sudo nano /etc/dnsmasq.conf
```

Scroll to the very end of the file and add the following lines. This makes it easy to separate your custom settings from the defaults.

```ini title="/etc/dnsmasq.conf"
# --- MY CUSTOM DNSMASQ CONFIGURATION ---

# For security, listen only on the local loopback interface.
listen-address=127.0.0.1

# Standard useful options.
domain-needed  # Don't forward plain names (without a dot)
bogus-priv     # Don't forward non-routable private IP addresses
strict-order   # Query upstream servers in the order they are listed
expand-hosts   # Add the local domain to entries in /etc/hosts

# The magic: any request for the .app.loc domain will return 127.0.0.1.
address=/app.loc/127.0.0.1

# Upstream DNS servers for internet access.
# Dnsmasq will query these if it doesn't know the domain.
server=8.8.8.8      # Google DNS
server=1.1.1.1      # Cloudflare DNS
# server=192.168.1.1  # You can also add your router's DNS
```

**What do these lines do?**
*   `listen-address=127.0.0.1`: Forces `dnsmasq` to listen for requests only on the local interface. This is an important security measure.
*   `domain-needed` & `bogus-priv`: These prevent `dnsmasq` from forwarding incomplete or private network requests to the public internet.
*   `address=/app.loc/127.0.0.1`: This is our wildcard setup. Any address ending in `.app.loc` will resolve to `127.0.0.1`.
*   `server=...`: Tells `dnsmasq` where to forward all other requests (like for `google.com`).

### Step 3: Resolve the Conflict with `systemd-resolved`

Modern Linux distributions use a service called `systemd-resolved` by default, which occupies DNS port 53 and prevents `dnsmasq` from starting. We need to configure it to free up the port.

Open the `systemd-resolved` configuration file:
```bash
sudo nano /etc/systemd/resolved.conf
```
In the `[Resolve]` section, find the `DNSStubListener` line, uncomment it (remove the leading `#`), and set its value to `no`. If the line doesn't exist, simply add it. It's also good practice to tell `systemd-resolved` to use our `dnsmasq` instance as a fallback.

```ini title="/etc/systemd/resolved.conf"
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
```
Save the file and exit the editor.

### Step 4: Apply Changes and Run the First Check

Now, let's restart both services to apply our changes.

```bash
sudo systemctl restart systemd-resolved
sudo systemctl restart dnsmasq
```

Let's confirm that `dnsmasq` has started successfully and claimed port 53.
```bash
sudo ss -tulnp | grep 53
```
In the output, you should see a `dnsmasq` process listening on port `127.0.0.1:53`.

Next, let's verify that `dnsmasq` itself is working correctly by sending it a direct query:
```bash
dig some.random.name.app.loc @127.0.0.1
```
In the `ANSWER SECTION`, you should see that the domain resolved to `127.0.0.1`. If so, `dnsmasq` is configured perfectly!

### Step 5: Configure the System to Use Dnsmasq

The final step is to tell the entire operating system to use our newly configured `dnsmasq` as its primary DNS server. We'll do this via `NetworkManager`, which is the standard network configuration tool on most modern desktops.

First, find the name of your active network connection:
```bash
nmcli connection show --active
```
Look for your primary connection in the list (e.g., `Wired connection 1` or `netplan-eno2`).

Now, run the following commands, **replacing `"YOUR_CONNECTION_NAME"`** with the name you just found:
```bash
# Set our local dnsmasq as the ONLY DNS server
sudo nmcli con mod "YOUR_CONNECTION_NAME" ipv4.dns "127.0.0.1"

# Prevent DHCP from overriding our manual setting
sudo nmcli con mod "YOUR_CONNECTION_NAME" ipv4.ignore-auto-dns yes

# Apply the settings by reconnecting the network
sudo nmcli con down "YOUR_CONNECTION_NAME" && sudo nmcli con up "YOUR_CONNECTION_NAME"
```

**Note:** These commands configure `NetworkManager` to update your `/etc/resolv.conf` file automatically. You can verify this by running `cat /etc/resolv.conf`. It should now contain `nameserver 127.0.0.1`.

### Step 6: The Final Test!

This is the moment of truth. Let's check that everything is working as expected.

Test your internet access:
```bash
ping google.com
```
Test your new local domain:
```bash
ping my-cool-project.app.loc
```

If both commands succeed—congratulations! You have successfully set up a powerful and convenient local DNS environment. You can now run projects on any port and access them through clean, unique names without ever touching `/etc/hosts` again.

Happy coding