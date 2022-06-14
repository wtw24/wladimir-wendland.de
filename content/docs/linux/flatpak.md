---
title: "Flatpak"
date: 2022-02-06
tags: ["linux", "flatpak"]
---

# Flatpak

## Add the Flathub repository
~~~shell
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
~~~


## Install the Software Flatpak plugin
~~~shell
sudo apt install gnome-software-plugin-flatpak
~~~


## List of all applications in the connected repository
~~~shell
flatpak remote-ls flathub
~~~


## Search apps
~~~shell
flatpak search gimp
~~~


## Install app
~~~shell
flatpak install flathub org.gimp.GIMP
~~~

~~~shell
flatpak install --bundle ~/Downloads/flatpak/org.inkscape.Inkscape.flatpak
~~~

~~~shell
flatpak install ~/Downloads/flatpak/org.inkscape.Inkscape.flatpakref
~~~


## Run App
~~~shell
flatpak run org.gimp.GIMP
~~~


## Updating Flatpak applications
~~~shell
flatpak update
~~~


## View installed packages
~~~shell
flatpak list --app
~~~


## Uninstalling apps
~~~shell
flatpak uninstall org.gimp.GIMP
~~~


## Remove a flatpak app and Purge personal app data
~~~shell
flatpak uninstall --delete-data org.Gnome.Todo
~~~


## Remove un-used runtime libraries
~~~shell
flatpak list --runtime
flatpak uninstall --unused
~~~


## Completely remove Flatpak Apps from your system
~~~shell
flatpak uninstall --all --delete-data
~~~


## However, a broken package may prevent the un-installation process, which can be fixed via command
~~~shell
sudo flatpak repair
~~~


## Remove the Flatpak daemon
~~~shell
sudo apt remove --autoremove flatpak
~~~
