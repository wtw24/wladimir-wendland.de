---
title: "Docker and Docker Compose Installation"
date: 2023-04-29
tags: ["docker", "docker compose", "software"]
---

# Install Docker and Docker Compose Installation

- https://docs.docker.com/engine/install/ubuntu/
- https://docs.docker.com/engine/install/linux-postinstall/


## Install Docker Engine


### Uninstall old versions

~~~shell
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
~~~


### Set up the repository
1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

~~~shell
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release
~~~

2. Add Docker’s official GPG key:
~~~shell
sudo install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
  && sudo chmod a+r /etc/apt/keyrings/docker.gpg
~~~
3. Use the following command to set up the **stable** repository. To add the **nightly** or **test** repository, add the word `nightly` or `test` (or both) after the word `stable` in the commands below.
~~~shell
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
~~~


### Install Docker Engine
~~~shell
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~


### Add your user to the docker group.
~~~shell
sudo usermod -aG docker $USER
~~~

3. **Log out** and **log back** in so that your group membership is re-evaluated.


---
## Install Docker Compose
1. Run this command to download the current stable release of Docker Compose:
~~~shell
sudo curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
~~~

2. Apply executable permissions to the binary:
~~~shell
sudo chmod +x /usr/local/bin/docker-compose
~~~

> **Note**: If the command docker-compose fails after installation, check your path. You can also create a symbolic link to /usr/bin or any other directory in your path.
~~~shell
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
~~~

3. Test the installation
~~~shell
docker-compose --version
~~~
