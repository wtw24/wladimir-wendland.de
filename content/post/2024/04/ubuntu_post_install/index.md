+++
title = "Things to Do After Installing Ubuntu 24.04 GNOME LTS"
date = "2024-04-27"
tags = [
  "linux",
  "ubuntu",
  "guide",
]
categories = [
  "linux",
]
+++
There's a unique satisfaction that comes with a fresh operating system install. Ubuntu 24.04 LTS boots up clean, fast, and full of potential. But a stock installation is just the starting point—a blank canvas. To transform it from a generic desktop into a personalized powerhouse tailored for development, productivity, and comfort, a series of deliberate steps are required. This is the process of making the system truly yours, equipping it with the right tools, tweaking the settings for a perfect workflow, and shaping the user interface to feel like home.

Over the years, I've refined a personal checklist that I run through after every new Ubuntu installation. It's a comprehensive guide that has evolved from a simple list of commands into a battle-tested script for creating my ideal work environment. In this post, I'm sharing that entire cheat sheet with you. We will cover everything from essential system updates and must-have software to powerful terminal customizations with Oh My Zsh, essential GNOME extensions for a streamlined desktop experience, and a robust setup for developers including Docker and Kubernetes tools. Whether you're a newcomer to Ubuntu or a seasoned user looking for new ideas, consider this your roadmap to a perfectly configured system.
<!--more-->


## Check and Install Package Updates
The following commands update the package lists, show upgradable packages,
perform the upgrade, and remove any old, unused packages.

Three different package manager front-ends are shown.

**Using Apt (the standard Ubuntu package manager)**
1. Refresh package lists
2. List upgradable packages
3. Upgrade all packages
4. Remove unused dependencies
~~~shell
sudo apt update && sudo apt list --upgradable && sudo apt upgrade && sudo apt autoremove
~~~

**Using Nala (a more user-friendly front-end for Apt)**

Same as above, but with Nala's parallel downloads and clearer output
~~~shell
sudo nala update && sudo nala list --upgradable && sudo nala upgrade && sudo nala autoremove
~~~

**Using Aptitude (another powerful front-end for Apt)**

Same as above, but using Aptitude for the upgrade process
~~~shell
sudo aptitude update && sudo apt list --upgradable && sudo aptitude upgrade && sudo apt autoremove
~~~



## Install Software and Tools:
Install a collection of essential command-line and GUI tools.

- **nano**: simple text editor;
- **nala/aptitude**: apt front-ends;
- **git/wget/curl**: download/version control tools;
- **mc**: terminal file manager;
- **copyq**: clipboard manager;
- **filezilla**: FTP client;
- **neofetch/inxi**: system information tools;
- **remmina**: remote desktop client;
- **make**: build tool;
- **htop**: process viewer;
- **gnome-sushi**: Nautilus file previewer;
- **zsh**: alternative shell;
- **duf**: disk usage utility;
- p**owerline/fonts-powerline**: status line styling for shells;
- **pavucontrol**: advanced audio control;
- **pipewire-pulse**: PulseAudio compatibility for PipeWire.
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
Install tools for advanced GNOME desktop configuration.

- **gnome-system-tools**: legacy admin tools;
- **dconf-editor**: low-level settings editor;
- **gnome-tweaks**: essential customization tool;
- **chrome-gnome-shell**: browser integration for extensions.
~~~shell
sudo apt install gnome-system-tools dconf-editor gnome-tweaks chrome-gnome-shell gnome-shell-extensions
~~~

### Installing additional support for archivers
Add support for various archive formats like .rar, .7z, .ace, etc.
~~~sh
sudo apt install p7zip-rar rar unrar unace arj cabextract
~~~

### Google Chrome
- https://www.google.com/intl/de_de/chrome/

Manual installation of Google Chrome browser.
- Download the .deb file from the official website.
- Use dpkg to install the downloaded .deb package.
~~~shell
sudo dpkg -i google-chrome-stable_current_amd64.deb
~~~

### Enpass
- https://support.enpass.io/app/getting_started/installing_enpass.htm

Install the Enpass password manager from its official repository.
- Add the Enpass repository to your system's sources.
- Download and add the repository's GPG key for verification.
- Update package lists and install Enpass.
~~~shell
echo "deb https://apt.enpass.io/  stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc
sudo apt-get update && sudo apt-get install enpass
~~~

### PhpStorm
- https://www.jetbrains.com/de-de/phpstorm/download/#section=linux

Manual installation of JetBrains PhpStorm IDE.
- Extract the downloaded tarball.
- Move the extracted folder to /opt, a common directory for optional software.
~~~shell
tar -xzf PhpStorm-2025.1.3.tar.gz
sudo mv PhpStorm-25* /opt/phpstorm
~~~
- Final step: Open PhpStorm and use its internal tool to create a .desktop file for the application menu.
~~~
`PhpStorm` > `Tools` > `Create Desktop Entry`
~~~

### DeaDBeeF Audio Player
- https://deadbeef.sourceforge.io/download.html
- https://sourceforge.net/projects/deadbeef/files/travis/linux

Install the DeaDBeeF audio player from a downloaded .deb file.
~~~shell
sudo apt install ./deadbeef-static*amd64.deb
~~~


## Terminal

### Terminal themes:
- https://mayccoll.github.io/Gogh/

Install a terminal color scheme using the "Gogh" script.
- This script downloads and runs an installer that offers many themes.
~~~shell
bash -c  "$(wget -qO- https://git.io/vQgMr)"
~~~
Azu

Adjusting GNOME Terminal preferences.
~~~
`Terminal` > `Preferences` > `General` > `Enable the menu acceleration key` > `OFF`
`Terminal` > `Profile +` > `Azu` > `Set as default`
`Terminal` > `Profile` > `Initial terminal size` > `126 columns` > `44 rows`
~~~


## Install Z-shell (Oh My Zsh)
Install the Oh My Zsh framework for managing Zsh configuration.
~~~shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~

### Install plugins:
Clone the zsh-autosuggestions plugin (suggests commands as you type).
~~~shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~~~
Clone the zsh-syntax-highlighting plugin (highlights shell commands).
~~~shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
~~~

### Enable Oh-my-zsh plugins
Edit the Zsh configuration file to enable the installed plugins.
~~~shell
nano ~/.zshrc
~~~
Ensure your personal bin directory is in the system's PATH.
~~~
export PATH=$HOME/bin:/usr/local/bin:$PATH
~~~
Add the new plugins to the plugins array in .zshrc.
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
Edit .zshrc to fix a common issue where pasting text into the terminal is slow.
~~~shell
nano ~/.zshrc
~~~
Add this line to disable a Zsh feature that can cause paste lag.
~~~
DISABLE_MAGIC_FUNCTIONS=true
~~~


## Install Gnome Extensions
Install base packages required for GNOME Shell Extensions.
~~~shell
sudo apt install gnome-shell-extensions gnome-menus gir1.2-gmenu-3.0
~~~
Below is a list of recommended GNOME Shell Extensions. They can be installed from the website.

### Dash to Panel
- https://extensions.gnome.org/extension/1160/dash-to-panel

Merges the top bar and dash into a single, configurable panel.

### Arc Menu
- https://extensions.gnome.org/extension/3628/arcmenu

A traditional application menu for GNOME.

### Caffeine
- https://extensions.gnome.org/extension/517/caffeine

Prevents the screen from locking or the system from suspending.

### Steal my focus window
- https://extensions.gnome.org/extension/6385/steal-my-focus-window

Prevents windows from stealing focus.

### Astra Monitor
- https://extensions.gnome.org/extension/6682/astra-monitor/

A system monitor extension for the top bar.


## Install Flatpak
Install Flatpak, a universal package management system.
~~~shell
sudo apt install flatpak
~~~
Add the Flathub remote, which is the main repository for Flatpak apps.
~~~shell
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
~~~
**Note**: A system restart is required to complete the setup and integrate Flatpak with the software center.

## Install Flatpak Apps:

### Warehouse
- https://flathub.org/de/apps/io.github.flattool.Warehouse

A tool to manage Flatpak applications, including their data and permissions.
~~~shell
flatpak install flathub io.github.flattool.Warehouse
~~~

### Flatseal
- https://flathub.org/apps/com.github.tchx84.Flatseal

A graphical utility to review and modify permissions for your Flatpak applications.
~~~shell
flatpak install flathub com.github.tchx84.Flatseal
~~~

### Gear Lever
- https://flathub.org/de/apps/it.mijorus.gearlever

Manage AppImages and integrate them into your system.
~~~shell
flatpak install flathub it.mijorus.gearlever
~~~

### Haruna Media Player
- https://flathub.org/de/apps/org.kde.haruna

A video player built with Qt/QML and libmpv.
~~~shell
flatpak install flathub org.kde.haruna
~~~

### Bruno
- https://flathub.org/de/apps/com.usebruno.Bruno

An open-source API client, alternative to Postman/Insomnia.
~~~shell
flatpak install flathub com.usebruno.Bruno
~~~

### Pika Backup
- https://flathub.org/de/apps/org.gnome.World.PikaBackup

A simple backup tool based on BorgBackup.
~~~shell
flatpak install flathub org.gnome.World.PikaBackup
~~~

### Disk Usage Analyzer (Baobab)
- https://flathub.org/apps/org.gnome.baobab

A graphical tool to analyze disk space usage.
~~~shell
flatpak install flathub org.gnome.baobab
~~~


## System Settings
Adjusting various system settings via the GUI.
~~~
# Enable extended input sources (e.g., for phonetic layouts) in Tweaks.
`Tweaks` > `Keyboard` > `Show Extended Input Sources` > `ON`

# Add a specific Russian phonetic keyboard layout.
`Settings` > `Keyboard` > `Input Sources` > `Add Input Sources` > `Russian (Germany, phonetic)`

# Disable the automatic screen lock.
`Settings` > `Privacy & Security` > `Screen Lock` > `Automatic Screen Lock` > `OFF`

# Show more information in the top bar clock.
`Settings` > `System` > `Date & Time` > `Week Day` > `ON`
`Settings` > `System` > `Date & Time` > `Date` > `ON`
`Settings` > `System` > `Date & Time` > `Seconds` > `ON`
`Settings` > `System` > `Date & Time` > `Week Numbers` > `ON`

# Open the language support utility to install additional language packs.
`Settings` > `System` > `Manage Installed Languages` > `Install / Remove Languages...`
~~~

## Add "Create New Document" option to Nautilus File Manager
This adds options to the right-click context menu in Nautilus.

Navigate to the user's Templates directory.
~~~shell
XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES) && cd "$XDG_TEMPLATES_DIR"
~~~
Create empty files that will serve as templates.
~~~shell
touch 'New Text File.txt' && touch 'New Markdown File.md'
~~~

## Nautilus Copy Path/Name
- https://github.com/chr314/nautilus-copy-path

Install a Nautilus extension that adds "Copy Path" and "Copy Name" to the context menu.

Install dependencies for Nautilus Python extensions.
~~~shell
sudo apt install python3-nautilus python3-gi
~~~
Clone the extension's repository.
~~~shell
git clone https://github.com/chr314/nautilus-copy-path.git
~~~
Navigate into the directory and run the installer.
~~~shell
cd nautilus-copy-path && make install
~~~



## Custom Hot Keys
Setting up a custom keyboard shortcut.
**Task Manager**
`Ctrl`+`Alt`+`Delete`
~~~shell
gnome-system-monitor
~~~



## Fonts
https://github.com/mozilla/Fira

### Common system-wide font directories.
- /usr/share/fonts
- /usr/local/share/fonts

### Install Microsoft fonts
Install the popular Microsoft Core Fonts package (Times New Roman, Arial, etc.).
~~~shell
sudo apt-get install ttf-mscorefonts-installer
~~~

### Manually Install Fonts
A script to manually install fonts from .ttf files.

Create a custom directory for your fonts.
~~~shell
sudo mkdir -p /usr/local/share/fonts/my_fonts
~~~
Copy your .ttf font files into the new directory.
~~~shell
sudo cp *.ttf /usr/local/share/fonts/my_fonts
~~~
Set the correct ownership and permissions for the font files and directory.
~~~shell
sudo chown root:staff /usr/local/share/fonts/my_fonts -R \
&& sudo chmod 644 /usr/local/share/fonts/my_fonts/* -R \
&& sudo chmod 755 /usr/local/share/fonts/my_fonts
~~~
Rebuild the system's font cache so the new fonts are recognized.
~~~shell
sudo fc-cache -fv
~~~



## Synaptic
- https://help.ubuntu.com/stable/ubuntu-help/addremove-install-synaptic.html.en

Install Synaptic, a graphical package manager, and Gdebi, for installing local .deb files.
~~~shell
sudo apt install synaptic gdebi
~~~

### Install Synaptic Quick-Search filter
This indexes packages and enables a faster search filter in Synaptic.
~~~shell
sudo apt-get install apt-xapian-index && sudo update-apt-xapian-index -vf
~~~



## How to disable Ctrl+Shift+U?

**Problem**

In the default "Ibus" input method, Ctrl+Shift+U is a shortcut to enter Unicode characters directly,
which can conflict with shortcuts in other applications (like IDEs).

**Solution**

Disable this shortcut using the IBus preferences utility.

Launch the IBus preferences panel from the terminal.
~~~shell
ibus-setup
~~~
- Go to the `Emoji` tab.
- Find the `Unicode code point:` entry and click the three dots (...) to edit its shortcut.
- In the dialog, click `Delete` to remove the keybinding, then `OK`.
- Close the IBus Preferences window. The change takes effect immediately.


## Change background to solid color
Use `gsettings` to change the desktop background to a solid color instead of an image.

Clear the image URIs for both light and dark modes.
~~~shell
gsettings set org.gnome.desktop.background picture-uri ""
gsettings set org.gnome.desktop.background picture-uri-dark ""
~~~
Set the desired solid color.
~~~shell
gsettings set org.gnome.desktop.background primary-color '#232f3e'
~~~


## Global Git ignore
Set up a global .gitignore file to exclude common files (like IDE folders) from all Git repositories on your system.

Create the global ignore file in your home directory.
~~~shell
touch ~/.gitignore
~~~
Open the file to add patterns to ignore (e.g., the .idea folder from JetBrains IDEs).
~~~shell
nano ~/.gitignore
~~~
~~~
.idea
~~~
Configure Git to use this file globally.
~~~shell
git config --global core.excludesFile '~/.gitignore'
~~~


## Install Docker
- https://docs.docker.com/engine/install/ubuntu/

### Uninstall old versions
Remove any old or conflicting Docker packages.
~~~shell
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
~~~
### Install using the apt repository
Add Docker's official GPG key for package verification.
~~~shell
sudo apt-get update \
    && sudo apt-get install ca-certificates curl \
    && sudo install -m 0755 -d /etc/apt/keyrings \
    && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
    && sudo chmod a+r /etc/apt/keyrings/docker.asc
~~~
Add the Docker repository to your system's Apt sources.
~~~shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && sudo apt-get update
~~~
Install the latest versions of the Docker packages.
~~~shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~
(Post-installation) Add your user to the 'docker' group to run docker commands without sudo.
~~~shell
sudo usermod -aG docker $USER
~~~
**Note**: You must log out and log back in for this group change to take effect.

## Additional Software

### ONLYOFFICE Desktop
- https://www.onlyoffice.com/download-desktop.aspx

A free office suite. Download from the official website.

### RcloneBrowser (Ubuntu Software)
- https://kapitainsky.github.io/RcloneBrowser/

A GUI for the powerful rclone command-line cloud storage tool.

### Grsync
A graphical user interface for rsync, a powerful file-syncing tool.
~~~shell
sudo apt install grsync
~~~

### Blueman - Bluetooth Manager
An advanced Bluetooth manager, often more reliable than the default.
~~~shell
sudo apt install blueman
~~~

## Access files and folders on Ext from Windows
List of Windows tools that can read Linux (Ext4) filesystems.
- [Linux Reader](https://www.diskinternals.com/linux-reader/)
- [Ext2Read](https://sourceforge.net/projects/ext2read/)

## Fix: GNOME Sushi freezes system when previewing OpenDocument
GNOME's file previewer (Sushi) may freeze on OpenDocument files (e.g., .odt).

Installing `unoconv` provides the necessary backend to fix this.
~~~shell
sudo apt install unoconv
~~~

## Detach Child Pop-up windows from Parent
A tweak to make modal dialogs (like "Save As...") appear as separate, movable windows.
~~~shell
gsettings set org.gnome.mutter attach-modal-dialogs false
~~~

## Add AppImage support
Install libfuse2, a common dependency required to run many AppImage applications.
~~~shell
sudo apt install libfuse2
~~~

---

## My GRUB config
Customizing the GRUB bootloader, often to set the correct resolution.

Use xrandr to find your monitor's native or preferred resolution.
~~~shell
xrandr
~~~
Edit the GRUB configuration file.
~~~shell
sudo nano /etc/default/grub
~~~
Set the kernel video mode to your desired resolution (e.g., 2560x1440).
~~~shell
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=2560x1440"
~~~
Update GRUB to apply the changes.
~~~shell
sudo update-grub
~~~
Update the initramfs (initial RAM filesystem).
~~~shell
sudo update-initramfs -u
~~~
Reboot to see the changes.
~~~shell
sudo reboot
~~~

## Scale GRUB menu on 4K displays
If the GRUB menu itself is too small on a high-resolution display, you can set its resolution.

Edit the GRUB configuration file.
~~~shell
sudo nano /etc/default/grub
~~~
Add these lines to set a lower resolution for the GRUB menu text.
~~~
GRUB_GFXMODE=800x600
GRUB_GFXPAYLOAD=keep
GRUB_TERMINAL=gfxterm
~~~
Update GRUB to apply the changes.
~~~shell
sudo update-grub
~~~

## QT Applications Style
Improve the look of Qt-based applications so they integrate better with the GNOME (GTK) theme.

Install Qt5 style plugins.
~~~shell
sudo apt install -y qt5-style-plugins
~~~
Set an environment variable to tell Qt apps to use the GTK2 theme engine.
~~~shell
echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
~~~


## Visual Studio Code
- https://code.visualstudio.com/download

## MuonSSH
A modern SSH client. Download from GitHub releases.
- https://github.com/devlinx9/muon-ssh/releases

## kubectl
Install the Kubernetes command-line tool.

Download the latest stable release binary.
~~~shell
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
~~~
Make the binary executable.
~~~shell
chmod +x ./kubectl
~~~
Move the binary to a directory in your PATH (e.g., a personal bin folder).
~~~shell
sudo mv ./kubectl ~/bin/kubectl
~~~

## minikube
- https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fdebian+package

Install Minikube, a tool for running a local Kubernetes cluster.

Download the .deb package for the latest release.
~~~shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
~~~
Install the downloaded package.
~~~shell
sudo dpkg -i minikube_latest_amd64.deb
~~~

## System Maintenance / Cleanup
A routine for system cleanup and backup.

- `lsblk` - List disks and partitions.
- `duf` - Check disk usage status.
- `bleachbit` - System cleanup (e.g., with BleachBit).
- `rsync`, `Synology Drive` - Backup / File backup (e.g., with rsync or a dedicated tool like Synology Drive).
- Restart if core system components were updated.

And there you have it—a comprehensive blueprint for transforming a fresh Ubuntu installation into a powerful, personalized workstation. The true power of a list like this isn't in following it verbatim, but in using it as a solid foundation to build upon. I encourage you to treat this guide as a starting point: feel free to pick and choose, substitute your favorite tools, and discard what doesn't fit your unique workflow. Ultimately, the goal is to craft a system that feels like an extension of yourself—one that gets out of your way and empowers you to do your best work. I hope this guide saves you time and helps you achieve exactly that.

Enjoy your newly configured, powerful, and uniquely personal Ubuntu desktop
