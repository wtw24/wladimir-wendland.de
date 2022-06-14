---
title: "Apt"
date: 2022-06-14
tags: ["linux", "apt"]
---

# Apt - Advanced package tool

## Update
~~~shell
sudo apt update && sudo apt list --upgradable && sudo  apt upgrade
~~~

~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoremove
~~~


## Upgrade only one package
~~~shell
apt install --only-upgrade curl
~~~


## Uninstall App
~~~shell
sudo apt-get purge anydesk
~~~

~~~shell
sudo apt-get autoclean
~~~

~~~shell
sudo apt-get autoremove
~~~


## Install Specific Version of a Package
~~~
sudo apt install <package_name>=<version_number>
~~~

~~~shell
sudo apt install phpmyadmin=4:4.9.5+dfsg1-2
~~~


### Which versions are available
~~~shell
apt list --all-versions <package_name>
~~~


## Install Package from Certain Software Source
~~~
sudo apt install -t <software_source> <package_name>
~~~

### find out the “<software_source>”
~~~shell
apt-cache policy | more
~~~

~~~shell
sudo apt install -t "o=LP-PPA-phpmyadmin" phpmyadmin
~~~

**or**
~~~shell
sudo apt install -t "l=PPA for phpMyAdmin" phpmyadmin
~~~
