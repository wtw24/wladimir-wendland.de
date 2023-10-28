---
title: "Things to Do After Installing Ubuntu GNOME 22.04 LTS"
date: 2023-04-29
tags: ["linux", "ubuntu"]
---

# Things to Do After Installing Ubuntu GNOME 22.04 LTS


## Check and Install Package Updates
~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoremove
~~~

~~~shell
sudo nala update && sudo nala list --upgradable && sudo nala upgrade && sudo nala autoremove
~~~

~~~shell
sudo aptitude update && sudo apt list --upgradable && sudo aptitude upgrade && sudo apt autoremove
~~~


## Enabling SSH
~~~shell
sudo apt install openssh-server
~~~

~~~shell
sudo systemctl enable ssh
~~~

~~~shell
sudo systemctl start ssh
~~~

~~~shell
sudo systemctl status ssh
~~~

~~~shell
sudo ufw allow ssh
~~~


## My Software and Tools
~~~shell
sudo apt install \
  nano \
  nala \
  git \
  wget \
  curl \
  mc \
  copyq \
  filezilla \
  neofetch \
  remmina \
  inxi \
  make \
  htop \
  gnome-sushi \
  aptitude \
  zsh \
  powerline \
  fonts-powerline
~~~


## System Tuning
~~~shell
sudo apt install gnome-system-tools dconf-editor gnome-tweaks chrome-gnome-shell gnome-shell-extensions
~~~


## Installing additional support for archivers
~~~sh
sudo apt install p7zip-rar rar unrar unace arj cabextract
~~~


## Show the Trash icon on the desktop
~~~shell
gsettings set org.gnome.shell.extensions.ding show-trash true
~~~

## Show the Home icon on the desktop
~~~shell
gsettings set org.gnome.shell.extensions.ding show-home 'true'
~~~

## Show the External Drives icons on the desktop

From GUI: `Extensions` >> `Desktop Icons NG (DNG)` >> `Settings`

~~~shell
gsettings set org.gnome.shell.extensions.ding show-volumes 'true'
~~~


## Add create 'New Document' option to Nautilus FileManager
~~~shell
XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES) && cd "$XDG_TEMPLATES_DIR"
~~~

~~~shell
touch 'New Text File.txt' && touch 'New Markdown File.md'
~~~

## Nautilus list view, permanently change the displayed columns
~~~shell
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'owner', 'permissions', 'date_modified_with_time', 'starred']"
~~~

### Default visible columns
~~~
['name', 'size', 'date_modified', 'starred']
['name', 'size', 'detailed_type', 'owner', 'permissions', 'date_modified_with_time', 'starred']
~~~

### Default column order
~~~
['name', 'size', 'type', 'owner', 'group', 'permissions', 'mime_type', 'where', 'date_modified', 'date_modified_with_time', 'date_accessed', 'date_created', 'recency', 'starred']
~~~

## Nautilus Copy Path/Name

- https://github.com/chr314/nautilus-copy-path/tree/1.8.0


## Install Z-shell (Oh My Zsh)
~~~shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~

### Install plugins:
~~~shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~~~

~~~shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
~~~

### Enable Oh-my-zsh plugins
~~~shell
nano ~/.zshrc
~~~
~~~
export PATH=$HOME/bin:/usr/local/bin:$PATH
~~~
~~~
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
)
~~~

### Fix very slow paste
~~~shell
nano ~/.zshrc
~~~
~~~
DISABLE_MAGIC_FUNCTIONS=true 
~~~


## Terminal themes:
- https://mayccoll.github.io/Gogh/

~~~shell
bash -c  "$(wget -qO- https://git.io/vQgMr)"
~~~

- Cai (32)


## QT Applications Style
~~~shell
sudo apt install -y qt5-style-plugins
~~~

~~~shell
echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
~~~


## Install Google Chrome
- https://www.google.com/intl/de/chrome/


## Install Visual Studio Code	
- https://code.visualstudio.com/download


## Install Gnome Extensions
- **Dash to Panel**		 
  - https://extensions.gnome.org/extension/1160/dash-to-panel
- **Arc Menu**		     
  - https://extensions.gnome.org/extension/3628/arcmenu

  **Install Arc Menu GNOME dependencies**
  ~~~shell
  sudo apt install gnome-shell-extensions gnome-menus gir1.2-gmenu-3.0
  ~~~ 
  
  **Fix: Settings Shortcut**
  `ArchMenu Settings` -> `Menu` -> `Application Shortcuts` -> `Settings` -> `...` -> `Modify` -> `Command`
  ~~~
  gnome-control-center
  ~~~
- **Caffeine**		     
  - https://extensions.gnome.org/extension/517/caffeine
- **Sound Input & Output Device Chooser**
  - https://extensions.gnome.org/extension/906/sound-output-device-chooser
- **User Themes**
  - https://extensions.gnome.org/extension/19/user-themes

  
## Synaptic
- http://help.ubuntu.ru/wiki/synaptic

~~~shell
sudo apt install synaptic gdebi
~~~

### Install Synaptic Quick-Search filter:
~~~shell
sudo apt-get install apt-xapian-index && sudo update-apt-xapian-index -vf
~~~


## Custom Hot Keys

**Task Manager**

`Ctrl`+`Alt`+`Delete`
~~~shell
gnome-system-monitor
~~~


### Terminal Hot Keys
~~~shell
sudo apt-get install wmctrl xdotool
~~~

~~~shell
# xdotool search --class "$program" windowactivate %@
# xdotool search --name "$program" windowactivate %@
~~~

**Minimize Terminal**

`Ctrl`+`Alt`+`H`
~~~shell
xdotool search -class gnome-terminal windowminimize %@
~~~


**Show hidden Terminal**

`Ctrl`+`Alt`+`F`
~~~shell
xdotool search -class gnome-terminal windowactivate %@
~~~


## Fonts

- https://github.com/mozilla/Fira

### Fonts Dirs
- /usr/share/fonts
- /usr/local/share/fonts


### Install Microsoft fonts
~~~shell
sudo apt-get install ttf-mscorefonts-installer
~~~


### Manually Install Fonts
~~~shell
sudo mkdir -p /usr/local/share/fonts/my_fonts
~~~

~~~shell
sudo cp *.ttf /usr/local/share/fonts/my_fonts
~~~

~~~shell
sudo chown root:staff /usr/local/share/fonts/my_fonts -R \
&& sudo chmod 644 /usr/local/share/fonts/my_fonts/* -R \
&& sudo chmod 755 /usr/local/share/fonts/my_fonts \
&& sudo fc-cache -fv
~~~


## Fix NTFS
~~~shell
sudo ntfsfix /dev/sda1
~~~


## How to disable Ctrl+Shift+U?

**Problem**

The problem is that with the **"Ibus"** input method, `Ctrl-shift-u` is by default configured to the **"Unicode Code Point"** shortcut. 
You can try this: Type `ctrl-shift-u`, then an (underlined) `u` appears. 
If you then type a unicode code point number in hex (e.g. 21, the ASCII/unicode CP for !) and press enter, it is replaced with the corresponding character.

**Solution**

This shortcut can be changed or disabled using the `ibus-setup` utility:

- Run `ibus-setup` from the terminal (or open IBus Preferences).
~~~shell
ibus-setup
~~~

- Go to `Emoji`.
- Next to `Unicode code point:`, click on the three dots (i.e. ...).
- In the dialog, click `Delete`, then `OK`.
- Close the IBus Preferences window.


## Boot repair
~~~sh
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair
boot-repair
~~~


## Install OpenVPN plugin
~~~shell
sudo apt install network-manager-openvpn-gnome openvpn-systemd-resolved
~~~

### VPN FritzBox

- https://avm.de/service/wissensdatenbank/dok/FRITZ-Box-6490-Cable/1471_VPN-zur-FRITZ-Box-unter-Linux-einrichten/

~~~shell
sudo apt-get install network-manager-vpnc-gnome
~~~

1. Starten Sie die **Advanced Network Configuration**, z.B. im Terminal über `nm-connection-editor`.
~~~shell
nm-connection-editor
~~~
2. Klicken Sie im Abschnitt `VPN` auf das `Pluszeichen`. Das Fenster `VPN hinzufügen` wird geöffnet.
3. Wählen Sie im Fenster `VPN hinzufügen` den Eintrag `Cisco-kompatibler VPN-Client (vpnc)` aus.
4. Tragen Sie im Eingabefeld `Name` einen beliebigen Namen (`FRITZ!Box-VPN`) ein.
5. Tragen Sie im Eingabefeld `Gateway` die MyFRITZ!-Adresse der FRITZ!Box (`pi80ewgfi72d2os42.myfritz.net`) ein.
4. Tragen Sie im Eingabefeld `Benutzername` den Benutzernamen des FRITZ!Box-Benutzers (`Max Mustermann`) ein.
5. Klicken Sie auf das Symbol im Eingabefeld `Benutzerpasswort`, wählen Sie den Option `Passwort nur für diesen Benutzer speichern` aus und tragen Sie dann das Kennwort des FRITZ!Box-Benutzers (`geheim1234`) ein.
> **Hinweis:** Bei einigen Ubuntu-Versionen muss stattdessen die Option `Passwort für alle Benutzer speichern` aktiviert werden.
6. Tragen Sie im Eingabefeld `Gruppenname` den Benutzernamen des FRITZ!Box-Benutzers (`Max Mustermann`) ein.
7. Klicken Sie auf das Symbol im Eingabefeld `Gruppenpasswort`, wählen Sie den Eintrag `Passwort nur für diesen Benutzer speichern` aus und tragen Sie dann das `Shared Secret` des FRITZ!Box-Benutzers (`Zj7hPCouK65IrPU4`) ein. Das `Shared Secret` wird in den VPN-Einstellungen des Benutzers im Abschnitt `iPhone, iPad oder iPod Touch` angezeigt.
8. Klicken Sie auf `Erweitert`.
9. Tragen Sie im Eingabefeld `Tunnel-Schnittstellenname` `tun0` ein und klicken Sie auf auf `Apply`.
10. Klicken Sie auf die Schaltfläche `Speichern`, um die Einrichtung abzuschließen. Falls die Schaltfläche `Speichern` ausgegraut ist, klicken Sie noch einmal auf `Erweitert` und dann auf `Apply` und wiederholen Sie das Speichern.
11. Klicken Sie bei der VPN-Verbindung auf den An/Aus-Schalter, um die Verbindung herzustellen.

- https://www.nerdharbor.de/2020/06/16/configure-vpn-connection-to-fritzbox-under-ubuntu-20-04/

~~~shell
sudo apt install vpnc network-manager-vpnc-gnome
~~~

Under **Settings** choose **Network** and under **VPN** add a new connection by clicking on **“+”**. 
You have to choose **“Cisco-compatible VPN-client (vpnc)“**!

![fritzvpn-settings](/img/fritzvpn-settings.png)


## Install Multimedia Codecs
~~~shell
sudo apt install ubuntu-restricted-extras
~~~


## Enable the Canonical Partners Repository

The **Canonical Partner** repository offers some proprietary applications such as **Adobe Flash Plugin**, 
that are closed-source but don’t cost any money to use. 
To enable it, open **Software & Updates**, once it launches, click on the **Other Software** tab.


## Change background to solid color

To clear the current image setting:
~~~shell
gsettings set org.gnome.desktop.background picture-uri ""
gsettings set org.gnome.desktop.background picture-uri-dark ""
~~~

To set the primary color (the first color in a gradient or the solid color):
~~~shell
gsettings set org.gnome.desktop.background primary-color '#232f3e'
~~~


## Global Git ignore
~~~shell
touch ~/.gitignore
~~~

~~~shell
nano ~/.gitignore
~~~

~~~
.idea
~~~

~~~shell
git config --global core.excludesFile '~/.gitignore'
~~~


## Install Flatpak
~~~shell
sudo apt install flatpak
~~~

Add the Flathub repository
~~~shell
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
~~~


## Blueman - Bluetooth Manager
~~~shell
sudo apt install blueman
~~~


## Restart PulseAudio
~~~shell
systemctl --user restart pulseaudio
~~~

## Font anti-aliasing in Ubuntu

- https://superuser.com/questions/8824/bad-font-anti-aliasing-in-ubuntu

Open up `.fonts.conf` under your home directory (`~/.fonts.conf`) and paste this in:
~~~
<?xml version="1.0" ?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
   <fontconfig>
      <match target="font">
         <edit name="autohint" mode="assign">
            <bool>true</bool>
         </edit>
      </match>
</fontconfig>
~~~

## Fix: Key is stored in legacy trusted.gpg keyring after Ubuntu 22.04 update

- https://askubuntu.com/questions/1403556/key-is-stored-in-legacy-trusted-gpg-keyring-after-ubuntu-22-04-update

~~~shell
apt-key list
~~~

Note: The DF7587C3 value comes from the last 8 characters of the pub code from the apt-key list output.

~~~shell
apt-key export DF7587C3 | sudo gpg --dearmour -o /usr/share/keyrings/skype-linux-client.gpg
~~~

~~~shell
sudo -H gedit /etc/apt/sources.list.d/skype-stable.list
~~~

~~~
deb [arch=amd64 signed-by=/usr/share/keyrings/skype-linux-client.gpg] https://repo.skype.com/deb stable main
~~~

~~~shell
sudo apt update
~~~

~~~shell
sudo apt-key del DF7587C3
~~~


## Fix GRUB for dual boot system
~~~shell
sudo nano /etc/default/grub
~~~

add:
~~~
GRUB_DISABLE_OS_PROBER=false 
~~~

~~~shell
sudo update-grub
~~~


## Scale GRUB menu on 4K displays
~~~shell
sudo nano /etc/default/grub
~~~

add:
~~~
GRUB_GFXMODE=800x600
GRUB_GFXPAYLOAD=keep
GRUB_TERMINAL=gfxterm
~~~

~~~shell
sudo update-grub
~~~


## Add AppImage support
~~~shell
sudo apt install libfuse2
~~~

## Adding a folder to side panel nautilus NOT as a bookmark
~~~shell
nano ~/.config/user-dirs.dirs
~~~

Default content
~~~
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# 
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
~~~

### Restore Defaults
Any changes takes effect after logout and login.
~~~shell
mv ~/.config/user-dirs.dirs ~/.config/user-dirs.dirs.broken
xdg-user-dirs-update
~~~

## Fix: GNOME Sushi freezes system when previewing OpenDocument
~~~shell
sudo apt install unoconv
~~~

## Detach Child Pop-up windows from Parent
~~~shell
gsettings set org.gnome.mutter attach-modal-dialogs false
~~~
