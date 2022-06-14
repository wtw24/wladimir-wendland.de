---
title: "GRUB"
date: 2022-02-06
tags: ["linux", "grub"]
---

# GRUB

## GRUB Rescue
~~~
grub rescue> ls
grub rescue> ls (hd0,msdos*)/boot/grub/
grub rescue> set prefix=(hd0,msdos*)/boot/grub
grub rescue> set root=(hd0,msdos*)/boot/grub
grub rescue> insmod ext2
grub rescue> insmod normal
grub rescue> normal
~~~

![fritzvpn-settings](/img/grub.jpg)

After boot write the command:
~~~shell
sudo update-grub
~~~

~~~shell
sudo grub-install /dev/sd_
~~~

## US-English Keyboard Layout
![fritzvpn-settings](/img/US-English.webp)
