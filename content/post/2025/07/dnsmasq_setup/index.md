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

I got tired of constantly editing my `/etc/hosts` file for every new project. I wanted to use clean, convenient local domains like `project-one.app.loc` or `api.my-app.app.loc` without having to define each one manually.

My solution is `Dnsmasq`, a lightweight DNS server that is perfect for this task. It allows me to set up **wildcard domains** (e.g., `*.app.loc`), where any subdomain automatically points to my local machine. It’s a set-it-and-forget-it setup that has saved me countless hours.

In this guide, I'll walk you through how I set up `dnsmasq` on modern Linux distributions like Ubuntu 24.04 and Fedora 42. I'll also show you how I resolve the common conflict with the default `systemd-resolved` service to create a powerful and convenient local development environment.
<!--more-->

### Step 1: Install Dnsmasq

First things first, I'll get the package installed from the standard repositories.

```bash
# On Ubuntu/Debian-based systems
sudo apt -y install dnsmasq

# On Fedora/CentOS/RHEL-based systems
sudo dnf -y install dnsmasq
```

### Step 2: Configure Dnsmasq

Now for my favorite part—the configuration. This is where I tell `dnsmasq` how to handle my local domains and where to forward all other requests.

I open the configuration file using my editor of choice (`nano` is great for this):

```bash
sudo nano /etc/dnsmasq.conf
```

I find it cleanest to scroll to the very end of the file and add my custom settings there. This way, I don't mix them up with the defaults. Here's the exact configuration I use:

```ini title="/etc/dnsmasq.conf"
# --- MY CUSTOM DNSMASQ CONFIGURATION ---

# For security, I listen only on the local loopback interface.
listen-address=127.0.0.1

# Standard useful options I always enable.
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
# server=192.168.1.1  # You can also add your router's DNS here
```

**Here's a quick breakdown of what these settings do for me:**
*   `listen-address=127.0.0.1`: This forces `dnsmasq` to listen for requests only on my local machine. It's an important security measure.
*   `domain-needed` & `bogus-priv`: These prevent `dnsmasq` from forwarding incomplete or private network requests out to the public internet.
*   `address=/app.loc/127.0.0.1`: This is the core of my wildcard setup. Any address ending in `.app.loc` resolves to `127.0.0.1`.
*   `server=...`: This tells `dnsmasq` where to forward all other requests (like for `google.com`).

### Step 3: Resolve the Conflict with `systemd-resolved`

On modern Linux systems, there’s a common hurdle: a service called `systemd-resolved` is already using DNS port 53, which prevents `dnsmasq` from starting. Here's how I handle this conflict.

I open the `systemd-resolved` configuration file:
```bash
sudo nano /etc/systemd/resolved.conf
```
Inside the `[Resolve]` section, my goal is to free up port 53. I find the `DNSStubListener` line, uncomment it (remove the `#`), and set its value to `no`. I also tell `systemd-resolved` to use my `dnsmasq` instance as its own DNS server.

```ini title="/etc/systemd/resolved.conf"
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
```
I save the file and exit the editor.

### Step 4: Apply Changes and Run the First Check

With the configs in place, it's time to apply the changes. I restart both services to make sure everything is reloaded correctly.

```bash
sudo systemctl restart systemd-resolved
sudo systemctl restart dnsmasq
```

Next, I confirm that `dnsmasq` has started successfully and claimed port 53.
```bash
sudo ss -tulnp | grep 53
```
In the output, I look for a `dnsmasq` process listening on `127.0.0.1:53`.

Then, I make sure `dnsmasq` itself is working by sending it a direct query:
```bash
dig some.random.name.app.loc @127.0.0.1
```
If I see the domain resolving to `127.0.0.1` in the `ANSWER SECTION`, I know my `dnsmasq` setup is perfect!

### Step 5: Configure the System to Use Dnsmasq

Okay, `dnsmasq` is running, but my system doesn't know to use it yet. The final step is to tell my entire OS to use it as the primary DNS server. I do this with `NetworkManager`, the standard tool on most modern desktops.

First, I need the name of my active network connection:
```bash
nmcli connection show --active
```
I look for my main connection in the list (it's usually something like `Wired connection 1` or `MyWifi`).

Now, I run the following commands, **replacing `"YOUR_CONNECTION_NAME"`** with the name I just found:
```bash
# Set my local dnsmasq as the ONLY DNS server
sudo nmcli con mod "YOUR_CONNECTION_NAME" ipv4.dns "127.0.0.1"

# Prevent DHCP from overriding my manual setting
sudo nmcli con mod "YOUR_CONNECTION_NAME" ipv4.ignore-auto-dns yes

# Apply the settings by reconnecting the network
sudo nmcli con down "YOUR_CONNECTION_NAME" && sudo nmcli con up "YOUR_CONNECTION_NAME"
```

**As a final check,** I always like to inspect `/etc/resolv.conf` by running `cat /etc/resolv.conf`. It should now contain just one line: `nameserver 127.0.0.1`.

### Step 6: The Final Test!

This is my favorite part—the moment of truth. I run two quick tests to make sure everything works.

I test my internet access:
```bash
ping google.com
```
And then I test my new local domain:
```bash
ping my-cool-project.app.loc
```

If both commands succeed, then I'm all set! I now have a powerful and convenient local DNS environment, and I can finally stop editing `/etc/hosts` for good.

Happy coding
