---
title: "GRUB"
weight: 20
categories: ["linux"]
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

After boot write the command:
~~~shell
sudo update-grub
sudo grub-install /dev/sd_
~~~

## US-English Keyboard Layout
![fritzvpn-settings](/img/US-English.webp)
