---
title: "SSH"
date: 2022-06-14
tags: ["linux", "ssh"]
---


# SSH - Secure Shell

- https://selectel.ru/blog/ssh-ubuntu-setup/


## Enabling SSH
~~~shell
sudo apt update && sudo apt install openssh-server
~~~

~~~shell
sudo systemctl status ssh
~~~

~~~shell
sudo ufw allow ssh
~~~


## Disabling SSH
~~~shell
sudo systemctl disable --now ssh
~~~

## Re-enable SSH
~~~shell
sudo systemctl enable --now ssh
~~~


## Disable password authentication in SSH
~~~shell
sudo nano /etc/ssh/sshd_config
~~~

~~~
PasswordAuthentication no
~~~

~~~shell
sudo systemctl restart ssh
~~~


## Create an RSA key pair
~~~shell
ssh-keygen -t rsa
~~~


## Correct file permissions for ssh keys and config
~~~shell
ssh-keygen -t rsa -b 4096 -N '' -C "email@gmail.com" -f ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -N '' -C "email@gmail.com" -f ~/.ssh/github_rsa
ssh-keygen -t rsa -b 4096 -N '' -C "email@gmail.com" -f ~/.ssh/mozilla_rsa
~~~

~~~shell
chmod 700 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

chmod 600 ~/.ssh/github_rsa
chmod 644 ~/.ssh/github_rsa.pub

chmod 600 ~/.ssh/mozilla_rsa
chmod 644 ~/.ssh/mozilla_rsa.pub
~~~

### ssh-agent
~~~shell
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/github_rsa
ssh-add ~/.ssh/mozilla_rsa
~~~


## Convert OpenSSH keys to Putty (.ppk)
~~~shell
sudo apt install putty-tools
~~~

~~~shell
puttygen -t rsa -C ~/.ssh/id_rsa -o ~/.ssh/id_rsa.ppk
~~~

or
~~~shell
cd ~/.ssh/
~~~

~~~shell
puttygen id_rsa -o id_rsa.ppk
~~~


## Custom cert
~~~shell
ssh demo@ip-adress.my -i ~/.ssh/id_demo
~~~


## .ssh/config
~~~
Host demo
    HostName ip-adress.my
    User demo
    Port 7654
    IdentityFile ~/.ssh/id_demo
    LogLevel INFO
    Compression yes
~~~


## Copy the public key file to your account on the remote system
~~~shell
ssh-copy-id -i ~/.ssh/id_rsa.pub <server-user>@<server-public-ip-address>
~~~


#### with non-standard SSH Port
~~~shell
ssh -o StrictHostKeyChecking=no deploy@${HOST} -p ${PORT} 'rm -rf site_${BUILD_NUMBER} && mkdir site_${BUILD_NUMBER}'
~~~

## SSH tunnel to forward port
~~~shell
ssh <host> -L<local_port>:<target_host>:<target_port>

# Example:
ssh <host> -L5306:localhost:3306
mysql -u<mysql_user> -p<mysql_pass> --protocol=tcp --port=5306 -hlocalhost <mysql_database>
~~~