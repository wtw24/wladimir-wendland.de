---
title: "Best Linux Apps"
date: 2022-06-14
tags: ["linux", "apps", "software", "flatpak"]
---

# Apps


## System Profiler and Benchmark
~~~shell
sudo apt install hardinfo
~~~


## Flatseal

Manage Flatpak permissions

- https://flathub.org/apps/details/com.github.tchx84.Flatseal

~~~shell
flatpak install flathub com.github.tchx84.Flatseal
~~~


## ONLYOFFICE Desktop Editors

Office productivity suite 

- https://flathub.org/apps/details/org.onlyoffice.desktopeditors

~~~shell
flatpak install flathub org.onlyoffice.desktopeditors
~~~



## Mailspring

The best email app for people and teams at work

- https://flathub.org/apps/details/com.getmailspring.Mailspring

~~~shell
flatpak install flathub com.getmailspring.Mailspring
~~~


## Thunderbird with system tray icon

- https://github.com/Ximi1970/systray-x

~~~shell
wget -q https://download.opensuse.org/repositories/home:/Ximi1970/xUbuntu_22.04/Release.key
~~~
~~~shell
sudo mv -f  Release.key  /etc/apt/trusted.gpg.d/Systray-x.Ximi1970.asc
~~~
~~~shell
sudo bash -c 'echo "deb https://download.opensuse.org/repositories/home:/Ximi1970:/Mozilla:/Add-ons/xUbuntu_22.04 ./" > /etc/apt/sources.list.d/systray-x.list'
~~~
~~~shell
sudo apt update
~~~
~~~shell
sudo apt install systray-x
~~~


## Thunderbird 102 (Beta-Channel)
Add Flathub-Beta-Channel
~~~shell
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
~~~

~~~shell
flatpak install flathub-beta org.mozilla.Thunderbird
~~~

Delete Flathub-Beta-Channel
~~~shell
flatpak remote-delete flathub-beta
~~~


## Déjà Dup Backups

Protect yourself from data loss

- https://flathub.org/apps/details/org.gnome.DejaDup

~~~shell
flatpak install flathub org.gnome.DejaDup
~~~


## GNOME Boxes [Ubuntu Software Center]

Virtualization made simple


## Drawing

Edit screenshots or memes

- https://flathub.org/apps/details/com.github.maoschanz.drawing

~~~shell
flatpak install flathub com.github.maoschanz.drawing
~~~


## draw.io

Create and share diagrams

- https://flathub.org/apps/details/com.jgraph.drawio.desktop

~~~shell
flatpak install flathub com.jgraph.drawio.desktop
~~~

## Pitivi

iMovie for Linux

- https://flathub.org/apps/details/org.pitivi.Pitivi

~~~shell
flatpak install flathub org.pitivi.Pitivi
~~~


## Curtail

Image Compression

- https://flathub.org/apps/details/com.github.huluti.Curtail

~~~shell
flatpak install flathub com.github.huluti.Curtail
~~~


## Metadata Cleaner

View and clean metadata in files

- https://flathub.org/apps/details/fr.romainvigier.MetadataCleaner

~~~shell
flatpak install flathub fr.romainvigier.MetadataCleaner
~~~


## Stacer

System optimizer and task manager

- https://github.com/oguzhaninan/Stacer

~~~shell
sudo apt install clamav stacer
~~~


## SoundConverter

Audio conversion tool that supports almost all file formats

- https://soundconverter.org/
- https://flathub.org/apps/details/org.soundconverter.SoundConverter

~~~shell
flatpak install flathub org.soundconverter.SoundConverter
~~~


## fre:ac

Audio converter and CD ripper

- https://flathub.org/apps/details/org.freac.freac

~~~shell
flatpak install flathub org.freac.freac
~~~


## qBittorrent

An open-source Bittorrent client

- https://flathub.org/apps/details/org.qbittorrent.qBittorrent

~~~shell
flatpak install flathub org.qbittorrent.qBittorrent
~~~


## ClamAV/ClamTk

ClamAV is an open-source and cross-platform command-line antivirus app for detecting Trojans, viruses, and other malicious codes. ClamTk is its GUI front-end

~~~shell
sudo apt install clamav clamtk
~~~

### Update virus databases
~~~shell
sudo systemctl stop clamav-freshclam
~~~

~~~shell
sudo freshclam
~~~

~~~shell
sudo systemctl start clamav-freshclam
~~~


## ClamTk

Easy to use graphical user interface for Clam Antivirus (ClamAV)

- https://flathub.org/apps/details/com.gitlab.davem.ClamTk

~~~shell
flatpak install flathub com.gitlab.davem.ClamTk
~~~


## Postman

Postman is a complete API development environment

- https://flathub.org/apps/details/com.getpostman.Postman

~~~shell
flatpak install flathub com.getpostman.Postman
~~~


## Foliate

A simple and modern eBook viewer

- https://flathub.org/apps/details/com.github.johnfactotum.Foliate

~~~shell
flatpak install flathub com.github.johnfactotum.Foliate
~~~


## Telegram Desktop

Fast. Secure. Powerful.

- https://flathub.org/apps/details/org.telegram.desktop

~~~shell
flatpak install flathub org.telegram.desktop
~~~


## Skype

Call and message skype users, with video chat support

- https://flathub.org/apps/details/com.skype.Client

~~~shell
flatpak install flathub com.skype.Client
~~~


## Feeds

News reader for GNOME

- https://flathub.org/apps/details/org.gabmus.gfeeds

~~~shell
flatpak install flathub org.gabmus.gfeeds
~~~


## Obsidian

Markdown-based knowledge base

- https://flathub.org/apps/details/md.obsidian.Obsidian

~~~shell
flatpak install flathub md.obsidian.Obsidian
~~~


## Zim

Write notes in a desktop wiki

- https://flathub.org/apps/details/org.zim_wiki.Zim

~~~shell
flatpak install flathub org.zim_wiki.Zim
~~~


## Getting Things GNOME!

Personal tasks and TODO-list items organizer

- https://flathub.org/apps/details/org.gnome.GTG

~~~shell
flatpak install flathub org.gnome.GTG
~~~


## Font Downloader

Install fonts from online sources

- https://flathub.org/apps/details/org.gustavoperedo.FontDownloader

~~~shell
flatpak install flathub org.gustavoperedo.FontDownloader
~~~


## Okular

Document Viewer

- https://flathub.org/apps/details/org.kde.okular

~~~shell
flatpak install flathub org.kde.okular
~~~


## VLC

VLC media player, the open-source multimedia player

- https://flathub.org/apps/details/org.videolan.VLC

~~~shell
flatpak install flathub org.videolan.VLC
~~~


## Krita

Digital Painting, Creative Freedom

- https://flathub.org/apps/details/org.kde.krita

~~~shell
flatpak install flathub org.kde.krita
~~~


## RawTherapee

An advanced raw photo development program

- https://flathub.org/apps/details/com.rawtherapee.RawTherapee

~~~shell
flatpak install flathub com.rawtherapee.RawTherapee
~~~


## Darktable

Organize and develop images from digital cameras

- https://flathub.org/apps/details/org.darktable.Darktable

~~~shell
flatpak install flathub org.darktable.Darktable
~~~