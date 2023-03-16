---
title: "Docker and Docker Compose Installation"
date: 2022-01-30
tags: ["docker", "docker compose", "software"]
---

# Install Docker and Docker Compose Installation

- https://docs.docker.com/engine/install/ubuntu/
- https://docs.docker.com/engine/install/linux-postinstall/


## Install Docker Engine


### Uninstall old versions
~~~shell
sudo apt remove docker docker-engine docker.io containerd runc
~~~


### Set up the repository
1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
~~~shell
sudo apt update
~~~

~~~shell
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
~~~

2. Add Docker’s official GPG key:
~~~shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
~~~
3. Use the following command to set up the **stable** repository. To add the **nightly** or **test** repository, add the word `nightly` or `test` (or both) after the word `stable` in the commands below.
~~~shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
~~~


### Install Docker Engine
~~~shell
sudo apt update
~~~

~~~shell
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~

Install a specific version using the version string from the second column, for example, `5:18.09.1~3-0~ubuntu-xenial`.
~~~shell
sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
~~~


### Manage Docker as a non-root user
1. Create the docker group.
~~~shell
sudo groupadd docker
~~~

2. Add your user to the docker group.
~~~shell
sudo usermod -aG docker $USER
~~~

3. **Log out** and **log back** in so that your group membership is re-evaluated.


### Configure Docker to start on boot
~~~shell
sudo systemctl enable docker.service
~~~

~~~shell
sudo systemctl enable containerd.service
~~~

To disable this behavior, use disable instead.
~~~shell
sudo systemctl disable docker.service
~~~

~~~shell
sudo systemctl disable containerd.service
~~~


### Uninstall Docker Engine
1. Uninstall the Docker Engine, CLI, and Containerd packages:
~~~shell
sudo apt-get purge docker-ce docker-ce-cli containerd.io
~~~

2. Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:
~~~shell
sudo rm -rf /var/lib/docker
~~~

~~~shell
sudo rm -rf /var/lib/containerd
~~~


---
## Install Docker Compose
1. Run this command to download the current stable release of Docker Compose:
~~~shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
~~~
or:
~~~shell
sudo curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/2.2.23/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
