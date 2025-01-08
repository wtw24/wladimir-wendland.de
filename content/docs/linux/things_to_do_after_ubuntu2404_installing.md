---
title: "Things to Do After Installing Ubuntu GNOME 24.04 LTS"
date: 2024-04-27
tags: ["linux", "ubuntu"]
---

# Things to Do After Installing Ubuntu GNOME 24.04 LTS



## Check and Install Package Updates
Apt:
~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoremove
~~~
Nala:
~~~shell
sudo nala update && sudo nala list --upgradable && sudo nala upgrade && sudo nala autoremove
~~~
Aptitude:
~~~shell
sudo aptitude update && sudo apt list --upgradable && sudo aptitude upgrade && sudo apt autoremove
~~~



## Install Software and Tools:
~~~shell
sudo apt install \
  nano \
  nala \
  aptitude \
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
  zsh \
  duf \
  powerline \
  fonts-powerline \
  pavucontrol \
  pipewire-pulse
~~~

### System Tuning
~~~shell
sudo apt install gnome-system-tools dconf-editor gnome-tweaks chrome-gnome-shell gnome-shell-extensions
~~~

### Installing additional support for archivers
~~~sh
sudo apt install p7zip-rar rar unrar unace arj cabextract
~~~

### Google Chrome 
https://www.google.com/intl/de_de/chrome/
~~~shell
sudo dpkg -i google-chrome-stable_current_amd64.deb
~~~

### Enpass
https://support.enpass.io/app/getting_started/installing_enpass.htm
~~~shell
echo "deb https://apt.enpass.io/  stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc
sudo apt-get update
sudo apt-get install enpass
~~~

### PhpStorm
https://www.jetbrains.com/de-de/phpstorm/download/#section=linux
~~~shell
tar -xzf PhpStorm-2024.1.1.tar.gz
sudo mv PhpStorm-24* /opt/phpstorm

sudo chown root:root -R phpstorm/
sudo chmod 4755 /opt/phpstorm/jbr/lib/chrome-sandbox
~~~
- `PhpStorm` > `Tools` > `Create Desktop Entry`

### DeaDBeeF Audio Player
- https://deadbeef.sourceforge.io/download.html
- https://sourceforge.net/projects/deadbeef/files/travis/linux/
~~~shell
sudo apt install ./deadbeef-static*amd64.deb
~~~



## Terminal
- `Terminal` > `Preferences` > `General` > `Enable the menu acceleration key` > `OFF`
- `Terminal` > `Profile +` > `wtw24` > `Set as default`
- `Terminal` > `Profile` > `Initial terminal size` > `126 columns` > `44 rows`

### Terminal themes:
https://mayccoll.github.io/Gogh/
~~~shell
bash -c  "$(wget -qO- https://git.io/vQgMr)"
~~~
( 16 ) Azu



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
    kube-ps1
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



## Install Gnome Extensions
~~~shell
sudo apt install gnome-shell-extensions gnome-menus gir1.2-gmenu-3.0
~~~ 

### Dash to Panel
https://extensions.gnome.org/extension/1160/dash-to-panel
### Arc Menu
https://extensions.gnome.org/extension/3628/arcmenu
### Caffeine
https://extensions.gnome.org/extension/517/caffeine
### Steal my focus window
https://extensions.gnome.org/extension/6385/steal-my-focus-window
### Astra Monitor
https://extensions.gnome.org/extension/6682/astra-monitor/
### Keep awake!
https://extensions.gnome.org/extension/1097/keep-awake/



## Install Flatpak
~~~shell
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# !!! To complete setup, restart system
~~~

## Install Flatpak Apps:

### Warehouse
https://flathub.org/de/apps/io.github.flattool.Warehouse
~~~shell
flatpak install flathub io.github.flattool.Warehouse
~~~

### Flatseal
https://flathub.org/apps/com.github.tchx84.Flatseal
~~~shell
flatpak install flathub com.github.tchx84.Flatseal
~~~

### Gear Lever
https://flathub.org/de/apps/it.mijorus.gearlever
~~~shell
flatpak install flathub it.mijorus.gearlever
~~~

### FileZilla
https://flathub.org/de/apps/org.filezillaproject.Filezilla
~~~shell
flatpak install flathub org.filezillaproject.Filezilla
~~~

### Koodo Reader
https://flathub.org/de/apps/io.github.troyeguo.koodo-reader
~~~shell
flatpak install flathub io.github.troyeguo.koodo-reader
~~~

### File Roller
https://flathub.org/de/apps/org.gnome.FileRoller
~~~shell
flatpak install flathub org.gnome.FileRoller
~~~

### Haruna Media Player
https://flathub.org/de/apps/org.kde.haruna
~~~shell
flatpak install flathub org.kde.haruna
~~~

### Skype
https://flathub.org/de/apps/com.skype.Client
~~~shell
flatpak install flathub com.skype.Client
~~~

### Mission Center
~~~shell
flatpak install flathub io.missioncenter.MissionCenter
~~~

### Meld
https://flathub.org/apps/org.gnome.meld
~~~shell
flatpak install flathub org.gnome.meld
~~~

### Bruno
https://flathub.org/de/apps/com.usebruno.Bruno
~~~shell
flatpak install flathub com.usebruno.Bruno
~~~

### Insomnia
https://flathub.org/apps/rest.insomnia.Insomnia
~~~shell
flatpak install flathub rest.insomnia.Insomnia
~~~

### Postman
https://flathub.org/apps/com.getpostman.Postman
~~~shell
flatpak install flathub com.getpostman.Postman
~~~

**Issue**: Postman crashes trying to load certificates

**Workaround**: create the certificates manually
~~~
cd ~/.var/app/com.getpostman.Postman/config/Postman/proxy \
    && openssl req -subj '/C=US/CN=Postman Proxy' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout postman-proxy-ca.key -out postman-proxy-ca.crt
~~~

### Disk Usage Analyzer
https://flathub.org/apps/org.gnome.baobab
~~~shell
flatpak install flathub org.gnome.baobab
~~~


## System Settings
- `Tweaks` > `Keyboard` > `Show Extended Input Sources` > `ON`
- `Settings` > `Keyboard` > `Input Sources` > `Add Input Sources` > `Russian (Germany, phonetic)`
- `Settings` > `Privacy & Security` > `Screen Lock` > `Automatic Screen Lock` > `OFF`
- `Settings` > `System` > `Date & Time` > `Week Day` > `ON`
- `Settings` > `System` > `Date & Time` > `Date` > `ON`
- `Settings` > `System` > `Date & Time` > `Seconds` > `ON`
- `Settings` > `System` > `Date & Time` > `Week Numbers` > `ON`
- `Settings` > `System` > `Manage Installed Languages` > `Install / Remove Languages...`



## Add create 'New Document' option to Nautilus FileManager
~~~shell
XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES) && cd "$XDG_TEMPLATES_DIR"
~~~
~~~shell
touch 'New Text File.txt' && touch 'New Markdown File.md'
~~~

## Nautilus Copy Path/Name
https://github.com/chr314/nautilus-copy-path
~~~shell
sudo apt install python3-nautilus python3-gi
~~~
~~~shell
git clone https://github.com/chr314/nautilus-copy-path.git
~~~
~~~shell
cd nautilus-copy-path && make install
~~~



## Custom Hot Keys
**Task Manager**
`Ctrl`+`Alt`+`Delete`
~~~shell
gnome-system-monitor
~~~



## Fonts
https://github.com/mozilla/Fira

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



## Synaptic
http://help.ubuntu.ru/wiki/synaptic
~~~shell
sudo apt install synaptic gdebi
~~~

### Install Synaptic Quick-Search filter:
~~~shell
sudo apt-get install apt-xapian-index && sudo update-apt-xapian-index -vf
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



## Install Docker
https://docs.docker.com/engine/install/ubuntu/
### Uninstall old versions
~~~shell
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
~~~
### Install using the apt repository
Add Docker's official GPG key:
~~~shell
sudo apt-get update \
    && sudo apt-get install ca-certificates curl \
    && sudo install -m 0755 -d /etc/apt/keyrings \
    && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && sudo chmod a+r /etc/apt/keyrings/docker.asc
~~~
Add the repository to Apt sources:
~~~shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && sudo apt-get update
~~~
Install the latest Docker packages
~~~shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~
Add host user to the docker group
~~~shell
sudo usermod -aG docker $USER
~~~
Log out and log back in so that group membership is re-evaluated.



## ONLYOFFICE Desktop
https://www.onlyoffice.com/download-desktop.aspx

## RcloneBrowser (Ubuntu Software)
https://kapitainsky.github.io/RcloneBrowser/

## Grsync
~~~shell
sudo apt install grsync
~~~

## Blueman - Bluetooth Manager
~~~shell
sudo apt install blueman
~~~

## Access files and folders on Ext from Windows
- [Linux Reader](https://www.diskinternals.com/linux-reader/)
- [Ext2Read](https://sourceforge.net/projects/ext2read/)

## Fix: GNOME Sushi freezes system when previewing OpenDocument
~~~shell
sudo apt install unoconv
~~~

## Detach Child Pop-up windows from Parent
~~~shell
gsettings set org.gnome.mutter attach-modal-dialogs false
~~~

## Add AppImage support
~~~shell
sudo apt install libfuse2
~~~

---

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

## QT Applications Style
~~~shell
sudo apt install -y qt5-style-plugins
~~~
~~~shell
echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
~~~


## Visual Studio Code	
https://code.visualstudio.com/download

## MuonSSH
https://github.com/devlinx9/muon-ssh/releases


# Bereinigung
1. Festplatten und Partitionen ermitteln: `lsblk`
2. Status der Festplattenbelegung ermitteln: `duf`
3. Bereinigung des Systems: `bleachbit`
4. Backup / Dateisicherung: `rsync`, `Synology Drive`
5. Neustart wenn Systemkomponenten aktualisiert werden


## kubectl
~~~shell
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
~~~
~~~shell
chmod +x ./kubectl
~~~
~~~shell
sudo mv ./kubectl ~/bin/kubectl
~~~

## minikube
https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fdebian+package
~~~shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
~~~