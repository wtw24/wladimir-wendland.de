---
title: "Things to Do After Installing Ubuntu GNOME 20.04/22.04 LTS (Focal Fossa)"
date: 2022-01-30
tags: ["linux", "ubuntu"]
---

# Things to Do After Installing Ubuntu GNOME 20.04 LTS (Focal Fossa)


## Check and Install Package Updates
~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade
~~~

~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoremove
~~~


# My Software and Tools
~~~shell
sudo apt install \
  nano \
  git \
  wget \
  curl \
  mc \
  copyq \
  filezilla \
  neofetch \
  remmina \
  inxi \
  htop
~~~


## Install GNOME Sushi

GNOME sushi - erweiterte Dateivorschau für Nautilus.
~~~sh
sudo apt install gnome-sushi
~~~


## Add create 'New Document' option to Nautilus FileManager
~~~shell
XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES) && cd "$XDG_TEMPLATES_DIR"
~~~

~~~shell
touch 'New Text File.txt' && touch 'New Markdown File.md'
~~~


## Install Z-shell (Oh My Zsh)
~~~shell
sudo apt install zsh powerline fonts-powerline
~~~

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
plugins=(
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

- Cai (27)
- Arthur (09)
- Afterglow (06)


## QT Applications Style
~~~shell
sudo apt install -y qt5-style-plugins
~~~

~~~shell
echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
~~~


## System Tuning
~~~shell
sudo apt install gnome-system-tools dconf-editor gnome-tweaks chrome-gnome-shell gnome-shell-extensions
~~~


## Installing additional support for archivers
~~~sh
sudo apt install p7zip-rar rar unrar unace arj cabextract
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
  ~~~shell
  # Install Arc Menu GNOME dependencies
  sudo apt install gnome-shell-extensions gnome-menus gir1.2-gmenu-3.0
  ~~~
- **Caffeine**		     
  - https://extensions.gnome.org/extension/517/caffeine
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


### Screenshots

**Screenshot - Grab the current window**

`Alt`+`Print`
~~~sh
sh -c '~/bin/sswin.sh'
~~~

**~/bin/sswin.sh**
~~~
#!/bin/bash
## Gnome-Screenshot - Grab the current window 
## sh -c '~/bin/sswin.sh'
## [Alt+Print]

DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -w -f ~/Pictures/Screenshots/Screenshot-$DATE.png
~~~

**Screenshot - Grab the whole screen**

`Shift`+`Print`
~~~shell
sh -c '~/bin/ssfull.sh'
~~~

**~/bin/ssfull.sh**
~~~
#!/bin/bash
## Gnome-Screenshot - Grab the whole screen 
## sh -c '~/bin/ssfull.sh'
## [Shift+Print]

DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -f ~/Pictures/Screenshots/Screenshot-$DATE.png
~~~


**Screenshot - Select area to grab**

`Print`
~~~shell
sh -c '~/bin/ssarea.sh'
~~~

**~/bin/ssarea.sh**
~~~
#!/bin/bash
## Gnome-Screenshot - Select area to grab 
## sh -c '~/bin/ssarea.sh'
## [Print]

DATE=$(date +%Y-%m-%d-%H:%M:%S)
gnome-screenshot -a -f ~/Pictures/Screenshots/Screenshot-$DATE.png
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

### Fonts Dirs
- /usr/share/fonts
- /usr/local/share/fonts

### Links
- https://github.com/mozilla/Fira


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
sudo chown root:staff /usr/local/share/fonts/my_fonts -R
~~~

~~~shell
sudo chmod 644 /usr/local/share/fonts/my_fonts/* -R
~~~

~~~shell
sudo chmod 755 /usr/local/share/fonts/my_fonts
~~~

~~~shell
sudo fc-cache -fv
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
https://www.nerdharbor.de/2020/06/16/configure-vpn-connection-to-fritzbox-under-ubuntu-20-04/

~~~shell
sudo apt install vpnc network-manager-vpnc-gnome
~~~

Under **Settings** choose **Network** and under **VPN** add a new connection by clicking on **“+”**. 
You have to choose **“Cisco-compatible VPN-client (vpnc)“**!

![fritzvpn-settings](/img/fritzvpn-settings.png)


## Install Media Codecs
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
~~~

To set the primary color (the first color in a gradient or the solid color):
~~~shell
gsettings set org.gnome.desktop.background primary-color '#232f3e'
~~~


## Global Git ignore
~~~shell
git config --global core.excludesFile '~/.gitignore'
~~~

~~~shell
make ~/.gitignore
~~~

~~~
.idea
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


## Install Flatpak
~~~shell
sudo apt install flatpak
~~~

Add the Flathub repository
~~~shell
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
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