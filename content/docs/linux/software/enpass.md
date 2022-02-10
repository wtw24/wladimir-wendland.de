---
title: "Enpass - Offline Password Manager"
date: 2022-01-30
tags: ["password manager", "software"]
---

# Enpass: Password Manager

Offline Password Manager and Secure Vault. Saves and fill in all your passwords.

- https://www.enpass.io

## Install

### To install Enpass, add a new repository to `/etc/apt/sources.list`:
~~~shell
sudo -i
echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
~~~

### And import key that is used to sign the release:
~~~shell
wget -O - https://apt.enpass.io/keys/enpass-linux.key | tee /etc/apt/trusted.gpg.d/enpass.asc
~~~

### After that, you can install Enpass as any other software package:
~~~shell
apt update && apt install enpass
exit
~~~
