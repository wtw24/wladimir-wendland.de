+++
title = "Things to Do After Installing Fedora 42 GNOME"
date = "2025-07-07"
tags = [
  "linux",
  "fedora",
  "guide",
]
categories = [
  "linux",
]
+++

Welcome, and congratulations on installing Fedora! A fresh OS is a blank slate, and this is your chance to craft it into something perfect for you. This guide is a collection of my personal post-install steps, refined over time, designed to get a system perfectly tuned for development and everyday tasks.

Think of this as your personal checklist to quickly get everything in order—from essentials like NVIDIA drivers and Docker to the finer details like custom fonts, a powerful terminal, and handy GNOME extensions. Don't treat this as a rigid script. Tailor it to your workflow: skip what you don't need and add your own favorite tools. Ultimately, the goal is to create a setup that feels like home and makes your daily work a pleasure.
<!--more-->

## Check and Install Package Updates
Upgrades all installed packages to their latest versions.
- `--refresh`: Forces DNF to fetch the latest metadata from repositories before upgrading.
- `sudo dnf autoremove`: Removes packages that were installed as dependencies but are no longer required by any installed package.
~~~shell
sudo dnf upgrade --refresh && sudo dnf autoremove
~~~

## Checks the current session type
- The output will be `wayland` or `x11`.
- This is useful information, especially when dealing with NVIDIA drivers, as Wayland support has improved but can still have issues.
~~~shell
echo $XDG_SESSION_TYPE
~~~

## Enable RPM Fusion Repositories
Installs the RPM Fusion `free` and `nonfree` repository configuration packages.
- This allows you to install software that isn't included in the official Fedora repositories.
- `$(rpm -E %fedora)` is a smart variable that automatically inserts your current Fedora version number (e.g., 40, 42).
~~~shell
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
~~~

## Install Proprietary NVIDIA Drivers
_(Note: this should only be done if you have an NVIDIA video card. Be sure to reboot the system after installation)._
- Installs the NVIDIA driver using `akmod` (Automatic Kernel Module).
- `akmod` automatically rebuilds the NVIDIA kernel module for any new kernel updates, which is the recommended method for Fedora.
~~~shell
dnf install akmod-nvidia
~~~
- Installs the `CUDA toolkit` drivers, which are required for GPU-accelerated computing tasks in applications like Blender, machine learning frameworks, etc.
~~~shell
dnf install xorg-x11-drv-nvidia-cuda
~~~

## Install useful utilities
Installs a batch of useful applications and tools.
- `gnome-tweaks`: A tool for advanced GNOME desktop customization.
- `gnome-terminal`: A popular and powerful terminal emulator.
- `pavucontrol`: PulseAudio Volume Control, an advanced mixer for managing audio devices and application volumes.
- `copyq`: An advanced clipboard manager with history and search.
- `zsh`: The Z Shell, a powerful alternative to the default bash shell.
- `nss-tools`: Network Security Services tools, required by 'mkcert' later in this guide.
~~~shell
sudo dnf install \
  gnome-tweaks \
  gnome-terminal \
  pavucontrol \
  copyq \
  zsh \
  nss-tools
~~~

## Set GNOME Terminal as Default
Uses the `gsettings` command-line tool to change a GNOME configuration key.
- This command sets the default terminal application to `gnome-terminal`.
~~~shell
gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
~~~

## Terminal (Gogh - Color Schemes)
- https://mayccoll.github.io/Gogh/
~~~shell
bash -c  "$(wget -qO- https://git.io/vQgMr)"
# Azu
~~~
~~~
Terminal > Preferences > General > Enable the menu acceleration key > OFF
Terminal > Profile + > Azu > Set as default
Terminal > Profile > Initial terminal size > 126 columns > 44 rows
~~~

## Install Z-shell (Oh My Zsh)
Downloads and runs the official `Oh My Zsh` installation script.
- `Oh My Zsh` is a popular open-source framework for managing your Zsh configuration.
~~~shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~

### Install plugins
Clones the `zsh-autosuggestions` plugin repository into the `Oh My Zsh` custom plugins directory.
- This plugin suggests commands as you type based on your history.
~~~shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~~~
Clones the `zsh-syntax-highlighting` plugin repository.
- This plugin provides real-time syntax highlighting for commands in the terminal.
~~~shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
~~~

### Opens the Zsh configuration file in the 'nano' text editor for editing.
~~~shell
nano ~/.zshrc
~~~
~~~ini
export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(
    git
    kube-ps1
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
)
~~~

## Enpass (Password Manager)
- Adds the official Enpass repository to your system's software sources using `dnf config-manager`.
- Installs the Enpass application from the newly added repository.
~~~shell
sudo dnf config-manager --add-repo https://yum.enpass.io/enpass-yum.repo
sudo dnf install enpass
~~~

## Flatpak Apps
- **Warehouse** - A tool to manage your Flatpak apps.
- **Flatseal** - A graphical utility to review and modify permissions for your Flatpak applications.
- **Gear Lever** - A tool for managing AppImages.
- **Haruna Media Player** - A media player.
- **Bruno** - An API client for testing.

## Gnome Extensions
### Dash to Panel
Merges the dash and top bar into a single panel.
https://extensions.gnome.org/extension/1160/dash-to-panel

### Arc Menu
Adds a traditional application menu.
https://extensions.gnome.org/extension/3628/arcmenu

### Caffeine
Prevents your PC from automatically suspending or showing a screensaver.
https://extensions.gnome.org/extension/517/caffeine

### Steal my focus window
Prevents windows from stealing focus.
https://extensions.gnome.org/extension/6385/steal-my-focus-window

### Astra Monitor
Displays system information (CPU, RAM) on the panel.
https://extensions.gnome.org/extension/6682/astra-monitor/

### AppIndicator and KStatusNotifierItem Support
Adds support for AppIndicator and KStatusNotifierItem icons (legacy tray icons) to the top panel.
- https://extensions.gnome.org/extension/615/appindicator-support/

## mkcert
A simple tool for making locally-trusted development certificates
- Downloads the latest mkcert binary for `linux/amd64`.
- -`JLO`: `-L` follows redirects, `-O` saves to a file, `-J` uses the server-specified filename.
- Makes the downloaded binary executable.
- Moves the executable to `/usr/local/bin`, making it available system-wide as the `mkcert` command.
~~~shell
curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
sudo mv mkcert-v*-linux-amd64 /usr/local/bin/mkcert
~~~

## Install Docker
- https://docs.docker.com/engine/install/fedora/

### Uninstall old versions
- Removes any older or conflicting versions of Docker that might be installed on the system.
~~~shell
sudo dnf remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine
~~~
### Set up the repository
- Installs the `dnf-plugins-core` package, which provides `the config-manager` utility.
- Adds the official Docker CE (Community Edition) repository to your system.
~~~shell
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
~~~
### Install Docker Engine
- Installs the main Docker components: the engine, CLI, containerd, and plugins for buildx and compose.
~~~shell
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~
### Start Docker Engine
- Enables the Docker service to start automatically on boot and starts it immediately.
~~~shell
sudo systemctl enable --now docker
~~~
### Add host user to the docker group
- Adds your current user `$USER` to the `docker` group.
- This is a crucial step that allows you to run docker commands without needing `sudo` every time.
~~~shell
sudo usermod -aG docker $USER
~~~
**Important**: Log out and log back in so that your group membership is re-evaluated.

## kubectl
- Downloads the kubectl binary. The inner `curl -LS ...` command finds the latest stable version number,
  and the outer curl command uses that to construct the full download URL.
~~~shell
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
~~~
- Makes the downloaded kubectl file executable.
~~~shell
chmod +x ./kubectl
~~~
- Moves the kubectl executable to a directory in your user's home (~/bin/).
- You should ensure ~/bin is in your system's PATH. (Oh My Zsh usually handles this).
~~~shell
sudo mv ./kubectl ~/bin/kubectl
~~~

## minikube
- https://minikube.sigs.k8s.io/docs/start

- Downloads the latest minikube release as an RPM package file for x86_64 architecture.
~~~shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm

# Note: After downloading, you need to install it.
sudo dnf install ./minikube-latest.x86_64.rpm
~~~

## Yaru Icons
- Installs the Yaru icon theme, which is the default theme used by Ubuntu.
~~~shell
sudo dnf install yaru-icon-theme
~~~

## Ubuntu font
- https://design.ubuntu.com/font

- Unzips the downloaded font archive into a new directory named `ubuntu-font`.
- Navigates into the newly created font directory.
- Creates a local font directory in your home folder if it doesn't already exist.
- `-p` ensures that parent directories are also created if needed.
- Copies all TrueType font files `*.ttf` into your local font directory.
- Rebuilds the system's font cache.
- `-f`: force, `-v`: verbose (shows which directories are being scanned). This makes the new fonts available to applications.
~~~shell
unzip ubuntu-font-family-*.zip -d ubuntu-font

cd ubuntu-font/ubuntu-font-family-0.83/
mkdir -p ~/.local/share/fonts/

cp *.ttf ~/.local/share/fonts/
fc-cache -f -v
~~~

## Background color
- Uses `gsettings` to configure the desktop background.
- These commands remove the wallpaper image for both `light` and `dark` themes and set a solid primary color instead.
~~~shell
gsettings set org.gnome.desktop.background picture-uri ""
gsettings set org.gnome.desktop.background picture-uri-dark ""
gsettings set org.gnome.desktop.background primary-color '#232f3e'
~~~

## Tweaks (Settings via GNOME Tweaks)
~~~
Appearance > Styles > Icons = Yaru-prussiangreen
Keyboard > Show Extended Input Sources = ON
Keyboard > Layout > Additional Layout Options > Switch to another layout > Caps Lock = ON
Windows > Titlebar Buttons > Maximize = ON
Windows > Titlebar Buttons > Minimize = ON
~~~

## Settings (Settings via the standard `Settings` application)
~~~
Settings > System > Date & Time > Time Format = 24-hour
Settings > System > Date & Time > Week Day = ON
Settings > System > Date & Time > Date = ON
Settings > System > Date & Time > Seconds = ON
Settings > System > Date & Time > Week Numbers = ON
~~~

## Nautilus extension that adds the `Open in Terminal` option to the right-click context menu
- Installs a package that provides a Nautilus (the file manager) extension for GNOME Terminal.
- Quits the Nautilus process so it can be restarted with the new extension loaded.
~~~shell
sudo dnf install gnome-terminal-nautilus
nautilus -q
~~~

## Nautilus Copy Path/Name
- https://github.com/chr314/nautilus-copy-path

- Installs dependencies required for Python-based Nautilus extensions.
~~~shell
sudo dnf install nautilus-python python3-gobject
~~~
- Clones the extension's source code from GitHub.
~~~shell
git clone https://github.com/chr314/nautilus-copy-path.git
~~~
- Navigates into the source directory and runs the installation script.
~~~shell
cd nautilus-copy-path && make install
~~~

## Add create `New Document` option to Nautilus
This is a clever one-liner.
- `XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES)`: Gets the path to your user's `Templates` directory and stores it in a variable.
- `&& cd "$XDG_TEMPLATES_DIR"`: Navigates into that directory.
- Creates empty files in the Templates directory.
- Any file in this directory will appear as an option in the `New Document` right-click context menu in Nautilus.
~~~shell
XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES) && cd "$XDG_TEMPLATES_DIR"
touch 'Text.txt' && touch 'Markdown.md'
~~~

## Detach Child Pop-up windows from Parent
- Changes a setting in Mutter (the GNOME window manager) to make modal dialogs (like "Save As...") appear as separate,
floating windows instead of being attached to their parent window.
~~~shell
gsettings set org.gnome.mutter attach-modal-dialogs false
~~~

## QT Applications Style to GTK
- Installs platform themes that allow Qt5 and Qt6 applications to use the system's current GTK theme.
- Creates a directory for environment variable definitions.
- Creates a config file that sets an environment variable for your session.
- This tells Qt applications to use the `gnome` platform theme, ensuring a consistent look and feel with GTK apps.
~~~shell
sudo dnf install qgnomeplatform-qt5 qgnomeplatform-qt6
mkdir -p ~/.config/environment.d/
echo "QT_QPA_PLATFORMTHEME=gnome" > ~/.config/environment.d/qt-theme.conf
~~~

## Global Git ignore
- Creates an empty global gitignore file in your home directory.
~~~shell
touch ~/.gitignore
~~~
- Opens the file for editing.
~~~shell
nano ~/.gitignore
~~~
- Add there, for example, `.idea` to ignore JetBrains IDE files in all projects.
~~~
.idea
~~~
- Configures Git globally to use the file you just created as a global ignore file for all your repositories.
~~~shell
git config --global core.excludesFile '~/.gitignore'
~~~

## Custom Hot Keys

**Task Manager** `Ctrl`+`Alt`+`Delete`
~~~shell
gnome-system-monitor
~~~

**Terminal** `Ctrl`+`Alt`+`T`
~~~shell
gnome-terminal
~~~

## Google Chrome
- https://www.google.com/intl/de_de/chrome/
- https://github.com/ilyhalight/voice-over-translation

## Cursor
- https://cursor.com

## Gemini CLI
- https://github.com/google-gemini/gemini-cli

**Prerequisites**: Ensure you have [Node.js version 20](https://nodejs.org/en/download) or higher installed.
~~~shell
npm install -g @google/gemini-cli

gemini
~~~

## Visual Studio Code
- https://code.visualstudio.com/download

## How to disable Ctrl+Shift+U?
**Problem**
The problem is that with the **"Ibus"** input method, `Ctrl-shift-u` is by default configured to the **"Unicode Code Point"** shortcut.
You can try this: Type `ctrl-shift-u`, then an (underlined) `u` appears.
If you then type a unicode code point number in hex (e.g. 21, the ASCII/unicode CP for !) and press enter, it is replaced with the corresponding character.

**Solution**
This shortcut can be changed or disabled using the `ibus-setup` utility:

- Run `ibus-setup` from the terminal (or open IBus Preferences).
~~~shell
# Launches the IBus (Intelligent Input Bus) preferences window.
ibus-setup
~~~
- Go to `Emoji`.
- Next to `Unicode code point:`, click on the three dots (i.e. ...).
- In the dialog, click `Delete`, then `OK`.
- Close the IBus Preferences window.

Great job! You've made it through all the steps, and now your Fedora setup is fully charged and ready to tackle anything. While each adjustment may seem small, together they add up to a massive improvement in comfort and efficiency, turning the stock OS into your own perfectly tuned toolkit.

With the groundwork laid, the real fun begins—daily use and continuous discovery. Fedora is a powerful and flexible system backed by a vibrant community, so there’s always something new to learn. I hope this guide served as a great launchpad for you. Enjoy your new setup and happy coding
