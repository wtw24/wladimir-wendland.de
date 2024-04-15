---
title: "Audio and Video"
date: 2024-04-14
tags: ["linux", "ubuntu", "audio", "video"]
---

# Audio and Video

# Audio

## DeaDBeeF
- https://deadbeef.sourceforge.io/download.html
- https://github.com/DeaDBeeF-Player/deadbeef

DeaDBeeF is a multiple-platform music player for desktop operating systems.

## MP3Gain
MP3Gain analyzes and adjusts mp3 files so that they have the same volume.

~~~shell
sudo apt install mp3gain
~~~
~~~shell
mp3gain -r -d 3 -p *.mp3
~~~

## How to convert MP3 ID3 tag encodings
- https://www.xmodulo.com/convert-mp3-id3-tag-encodings-linux.html

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


## Kid3 - Audio Tagger
If you want to easily tag multiple MP3, Ogg/Vorbis, FLAC, Monkey’s Audio, MPC, MP4/AAC, MP2, Opus, Speex, TrueAudio,
WavPack, WMA/WMV, WAV and AIFF files (e.g. full albums) without typing the same information again and again and have
control over both ID3v1 and ID3v2 tags, then Kid3 is the program you are looking for.

~~~shell
flatpak install flathub org.kde.kid3
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


# Video

## Haruna Media Player
Open source media player built with Qt/QML and libmpv
~~~shell
flatpak install flathub org.kde.haruna
~~~

## VLC
VLC media player, the open-source multimedia player

- https://flathub.org/apps/details/org.videolan.VLC

~~~shell
flatpak install flathub org.videolan.VLC
~~~

## Pitivi

iMovie for Linux

- https://flathub.org/apps/details/org.pitivi.Pitivi

~~~shell
flatpak install flathub org.pitivi.Pitivi
~~~
