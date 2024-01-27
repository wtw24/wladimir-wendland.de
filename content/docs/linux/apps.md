---
title: "Best Linux Apps"
date: 2023-04-29
tags: ["linux", "apps", "software", "flatpak"]
---

# Apps


## HardInfo

System Profiler and Benchmark

~~~shell
sudo apt install hardinfo
~~~


## Flatseal

Manage Flatpak permissions

- https://flathub.org/apps/details/com.github.tchx84.Flatseal

~~~shell
flatpak install flathub com.github.tchx84.Flatseal
~~~

### Obsidian - Markdown-based knowledge base
~~~shell
flatpak install flathub md.obsidian.Obsidian
~~~

### Telegram Desktop
~~~shell
flatpak install flathub org.telegram.desktop
~~~

### ONLYOFFICE Desktop Editors
~~~shell
flatpak install flathub org.onlyoffice.desktopeditors
~~~

### Skype
~~~shell
flatpak install flathub com.skype.Client
~~~


## GIMP Image Editor

- https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/gimp
- https://packages.ubuntu.com/focal/amd64/gimp-plugin-registry/filelist
- https://github.com/pixlsus/registry.gimp.org_static/tree/master/registry.gimp.org/files
- https://gmic.eu/download.html

~~~shell
sudo add-apt-repository ppa:ubuntuhandbook1/gimp
~~~
~~~shell
sudo apt update
~~~
~~~shell
sudo apt install gimp
~~~

**install gimp-plugin-registry**
~~~shell
sudo apt-add-repository universe
~~~
~~~shell
sudo apt-get install gimp-plugin-registry
~~~

**uninstall**:
~~~shell
sudo apt install ppa-purge
~~~
~~~shell
sudo ppa-purge ppa:ubuntuhandbook1/gimp
~~~


## XnView MP

- https://www.xnview.com/en/xnviewmp/#downloads


## XnConvert

- https://www.xnview.com/en/xnconvert/#downloads


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


## Shutter (Screenshot Tool)
~~~shell
sudo add-apt-repository ppa:linuxuprising/shutter
~~~
~~~shell
sudo apt install shutter
~~~


## Shutter Encoder

A converter designed by video editors.

- https://www.shutterencoder.com/
- https://www.shutterencoder.com/en/thanks.html

~~~shell
wget https://www.shutterencoder.com/Shutter%20Encoder%2016.2%20Linux%2064bits.deb -O shutterencoder.deb
~~~

~~~shell
sudo apt install ./shutterencoder.deb
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


## MP3Gain

MP3Gain analyzes and adjusts mp3 files so that they have the same volume.

~~~shell
sudo apt install mp3gain
~~~
~~~shell
mp3gain -r -d 3 -p *.mp3
~~~


## Kid3 - Audio Tagger

If you want to easily tag multiple MP3, Ogg/Vorbis, FLAC, Monkey’s Audio, MPC, MP4/AAC, MP2, Opus, Speex, TrueAudio, 
WavPack, WMA/WMV, WAV and AIFF files (e.g. full albums) without typing the same information again and again and have 
control over both ID3v1 and ID3v2 tags, then Kid3 is the program you are looking for.

~~~shell
flatpak install flathub org.kde.kid3
~~~


## How to convert MP3 ID3 tag encodings

### Install mid3iconv on Linux
The `mid3iconv` tool is part of `python3-mutagen` package, which is universally available on major Linux platforms.
~~~shell
sudo apt-get install python3-mutagen
~~~

### Convert ID3 Character Encodings with mid3iconv
For example, to convert ID3's character encoding from `CP1252` to `UTF-8/Unicode`:
~~~shell
mid3iconv -e CP1251 -d *.mp3
~~~

The typical command-line usage of mid3iconv is as follows.
~~~shell
mid3iconv -e <source-encoding> -d input.mp3
~~~

## OpenSnitch

OpenSnitch is a GNU/Linux port of the Little Snitch application firewall

- https://github.com/evilsocket/opensnitch/releases
- https://github.com/evilsocket/opensnitch/issues/647

~~~shell
sudo apt install ./opensnitch*.deb ./python3-opensnitch-ui*.deb
~~~

~~~shell
sudo apt install python3-pip python3-pyasn
~~~

~~~shell
pip3 install --user qt-material
~~~

~~~shell
pip3 install --user --ignore-installed grpcio
~~~


## Mission Center
Monitor system resource usage
- https://flathub.org/de/apps/io.missioncenter.MissionCenter
~~~shell
flatpak install flathub io.missioncenter.MissionCenter
~~~



## Guake 

drop-down terminal

~~~shell
sudo apt install guake
~~~

Custom Shortcut:

Name
~~~
Guake
~~~

Command:
~~~shell
guake-toggle
~~~

Shortcut:
~~~
F12
~~~


## CPU-X

Gathers information on CPU, motherboard and more

- https://github.com/X0rg/CPU-X/releases

~~~shell
sudo apt install cpu-x
~~~


## Etcher

Flash OS images to SD cards & USB drives, safely and easily.

- https://www.balena.io/etcher/
- https://github.com/balena-io/etcher/releases


