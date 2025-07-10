+++
title = "Troubleshooting Linux"
date = "2024-01-20"
tags = [
  "linux",
  "troubleshooting",
  "guide",
]
categories = [
  "linux",
]
+++

For any professional working with Linux, the command line is the primary tool, and knowledge of its commands is their professional arsenal. While Linux has thousands of utilities, 90% of day-to-day diagnostic and troubleshooting tasks can be solved with a small but powerful set of commands. Mastering this set is what distinguishes an experienced administrator, enabling them to tackle any problem quickly and confidently.

In this post, I have compiled that very time-tested arsenal for you. This isn't just a random list; it's a structured cheat sheet created for practical application. All the commands are grouped by the type of problem you're trying to solve—from checking disk space and analyzing network traffic to inspecting running processes and diving deep into system logs. Bookmark this page, and it will become your trusted guide, helping you quickly get from the question, "What happened?" to the answer, "Here's the problem."
<!--more-->

## System & Hardware Info
~~~shell
# Show all information about the kernel, hostname, and hardware architecture.
uname -a

# Get the Linux distribution version.
lsb_release -a
cat /etc/os-release

# Display detailed information about the processor (CPU).
lscpu

# List all PCI devices.
lspci

List all USB devices.
lsusb
~~~

## Monitoring
Popular monitoring systems
- **Zabbix** - https://www.zabbix.com
- **Nagios** - https://www.nagios.org/
- **Prometheus** - https://prometheus.io/

## Disc space
~~~shell
# Show disk space usage in a human-readable format (KB, MB, GB)
df -h

# Show inode usage. Useful for cases where you can't create new files even with free space
df -i

# Show the total size of a specific directory
du -sh /tmp

# Show the size of all top-level directories within the current folder, sorted from largest to smallest
du -h --max-depth=1 | sort -hr
# An alternative syntax for the same action
du -h -d 1 | sort -hr

# Show the size of ALL files and directories in a specific path, sorted largest to smallest
du -ah /tmp | sort -rh

# A practical example: find all directories inside node_modules that are megabytes in size, sorted largest to smallest
du -sh ./node_modules/* | sort -nr | grep '\dM.*'

# Find files larger than 1GB in the root directory
find / -type f -size +1G


# List open files that have been deleted but are still held by a process
lsof | grep '(deleted)'


# List block devices (disks, partitions)
lsblk

# Display all S.M.A.R.T. health information for a specific drive
smartctl -a /dev/sda
smartctl -a /dev/nvme1n1

# Check the status of software RAID (mdadm) arrays
cat /proc/mdstat
~~~

## Disc load
~~~shell
sudo apt install sysstat
# Report CPU and I/O statistics for devices and partitions
iostat

sudo apt install iotop
# Display a top-like table of current I/O usage by process
sudo iotop
~~~

## Processor load
~~~shell
# Display dynamic real-time view of running processes and system resource usage
top

# An interactive process viewer (an improved 'top')
htop

# Show processes in a tree-like format
pstree

# Show how long the system has been running, and the system load averages
uptime


# List all files and network connections opened by a specific process
lsof -p <PID>


# Send a signal to a process to terminate it (by PID)
kill <PID>

# Forcefully terminate a process (use with caution)
kill -9 <PID>

# Kill processes by name
pkill <process_name>
killall <process_name>
~~~

## RAM load
~~~shell
# Display dynamic real-time view of running processes and system resource usage
top
htop

# Report virtual memory statistics
vmstat

# Display the amount of free and used memory in the system (in megabytes)
free -m

# Show detailed memory information from the kernel
cat /proc/meminfo
~~~

## Processes
~~~shell
# List all running processes on the system in a user-friendly format
ps aux

# Check the status of a systemd service
systemctl status <PROCESS>

# Trace system calls and signals for a running process by its PID
strace -p <PID>
~~~

## Network
~~~shell
# Show listening TCP and UDP sockets (a modern replacement for netstat)
ss -lntu

# Show TCP sockets with the processes using them
ss -tp


sudo apt install net-tools
# Show listening TCP and UDP sockets with program names (classic tool)
netstat -tulpn


# Show all network interfaces and their IP addresses (modern)
ip a
# Show all network interfaces and their IP addresses (classic, often deprecated)
ifconfig


# Display the kernel IP routing table (classic)
netstat -rn
# Display the kernel IP routing table (modern)
ip r


# Send ICMP ECHO_REQUEST packets to network hosts to check connectivity
ping <IP/HOST>

# Scan for open ports on a host
nmap <IP/HOST>

# A network diagnostic tool that combines 'ping' and 'traceroute'
mtr <IP>


# Display bandwidth usage on an interface in a top-like view
iftop


sudo apt install inetutils-traceroute
# Print the route packets take to a network host
traceroute <IP>

# DNS lookup utility
dig <dns-name>

# Query a specific DNS server
dig @<dns-server> <dns-name>

# Query for a specific record type (e.g., A, MX, TXT)
dig -t <record-type> <dns-name>

# Query Internet name servers interactively (another DNS tool)
nslookup


# Make an HTTP request, follow redirects (-L) and show verbose output (-v), including headers
curl -Lv <domain>

# Check if a specific TCP port is open and accessible
curl -v telnet://127.0.0.1:22

# Communicate with a service via a Unix socket (e.g., Docker)
curl --unix-socket /var/run/docker.sock http://images/json


# Dump traffic on a network. A powerful packet analyzer.
# This example captures traffic on any interface, on port 9100, without resolving hostnames or port names (-nn)
tcpdump -i any port 9100 -nn

# This example captures traffic on interface eth0 for port 22 (SSH) to/from a specific host
tcpdump -i eth0 port 22 and host 33.22.33.1
~~~

## Logs
~~~shell
# Navigate to the standard directory for system logs
cd /var/log

# Follow the last 50 lines of a log file in real-time
tail -f -n50 /var/log/syslog
tail -f -n50 /var/log/auth.log

# Follow the kernel log file
tail -f -n50 /var/log/kern.log

# Print or control the kernel ring buffer, with human-readable timestamps (-T)
sudo dmesg -T

# Query the systemd journal
journalctl

# Follow the journal in real-time (like tail -f)
journalctl -f

# Show logs from the current boot
journalctl -b

# Show logs since a specific time (e.g., "1 hour ago" or "2023-10-27 10:00:00")
journalctl --since "1 hour ago"

# Show all logs for a specific systemd unit (e.g., nginx), with explanations (-x) and jump to the end (-e)
journalctl -xeu nginx
~~~

## Users & Security
~~~shell
# Show who is logged on
who

# Show last logged in users
last


# Execute a command as another user (default is root)
sudo <command>

# Switch to the root user
su -
~~~

I hope this structured cheat sheet will help you save precious time and stress during the next incident. With this arsenal at your fingertips, you can spend less time searching for the right command and more time on solving the problem itself.

Bookmark this page, and may your systems always run stably.
