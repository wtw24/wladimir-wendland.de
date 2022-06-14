---
title: "dd"
date: 2022-06-14
tags: ["linux", "dd"]
---

# dd - data definition


## Show mounted devices
~~~shell
df -h
~~~

~~~shell
sudo lsblk
~~~


## Backup
~~~shell
sudo su
~~~

~~~shell
dd if=[DISC_PATH] | gzip > ./[NAME].img.gz
~~~


## Restore
~~~shell
sudo su
~~~

~~~shell
gzip -cd ./[NAME].img.gz | dd of=[DISC_PATH] 
~~~
