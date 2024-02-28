---
title: "Troubleshooting Linux"
date: 2024-01-20
tags: ["linux", "troubleshooting"]
---


# Troubleshooting Linux

## Monitoring
- Zabbix
- Nagios
- Prometheus

## Disc space
~~~shell
df -h
# inode
df -i
# dir size
du -sh /tmp

# show the size of all folders and files in a particular folder, sorting them by size
du -h --max-depth=1 | sort -hr
# with details
du -ah /tmp | sort -rh

lsblk

# SMART Attributes Data Structure
smartctl -a /dev/sda
smartctl -a /dev/nvme1n1

# RAID info
cat /proc/mdstat
~~~

## Disc load
~~~shell
sudo apt install sysstat
iostat

sudo apt install iotop
sudo iotop
~~~

## Processor load
~~~shell
top
htop
# load average
uptime
~~~

## RAM load
~~~shell
top
htop
vmstat
free -m
cat /proc/meminfo
~~~

## Processes
~~~shell
ps aux
systemctl status <PROCESS>
strace -p <PID>
~~~

## Network
~~~shell
ss -lntu

sudo apt install net-tools
netstat -tulpn

ip a
ifconfig

# IP routing table
netstat -rn
ip r

ping <IP/HOST>

# Trace
mtr <IP>

sudo apt install inetutils-traceroute
traceroute <IP>

# DNS
dig <dns-name>
dig @<dns-server> <dns-name>
dig -t <record-type> <dns-name>
nslookup

# HTTP/HTTPS
curl -Lv <domain>
# Port
curl -v telnet://127.0.0.1:22
# Socket
curl --unix-socket /var/run/docker.sock http://images/json

tcpdump -i any port 9100 -nn
tcpdump -i eth0 port 22 and host 33.22.33.1
~~~

## Logs
~~~shell
cd /var/log

tail -f -n50 /var/log/syslog
tail -f -n50 /var/log/auth.log

# Kernel logs
tail -f -n50 /var/log/kern.log
sudo dmesg -T

journalctl
journalctl -xeu nginx
~~~
