---
title: "How to Create a .Desktop File"
date: 2023-04-11
tags: ["linux", "ubuntu"]
---

## Create .Desktop Files With a Third-Party Program

- https://www.florian-diesch.de/software/arronax/

~~~shell
sudo add-apt-repository ppa:diesch/stable
~~~

~~~shell
sudo apt install arronax
~~~

## Create Desktop Launchers

### application-name.desktop
~~~
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
~~~

### Path (user only)
~~~shell
~/.local/share/applications/
~~~

### Path (global)
~~~
/usr/share/applications/
~~~