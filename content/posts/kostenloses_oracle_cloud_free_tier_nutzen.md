---
author: "Wladimir Wendland"
date: 2021-02-02
title: Kostenloses Oracle Cloud Free Tier nutzen
weight: 10
---

Wer sich bei Oracle für Cloud Free Tier registriert, kann in der Oracle-Cloud kostenlos verschiedene Ressourcen verwenden.

> Jeder Mandant erhält die ersten 3.000 OCPU-Stunden und 18.000 GB-Stunden pro Monat kostenlos, um Ampere A1-Compute-Instanzen mit der Ausprägung VM.Standard.A1.Flex zu erstellen (entspricht 4 OCPUs und 24 GB Arbeitsspeicher). Außerdem erhält jeder Mandant zwei kostenlose VM.Standard.E2.1.Micro-Instanzen.

## Nützliche Links

- [Oracle Cloud Free Tier testen](https://developer.oracle.com/de/free/)
- [Ressourcen vom Typ "Immer kostenlos"](https://docs.oracle.com/de-de/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm)
- [Free Tier: WordPress auf einer Ubuntu-Instanz installieren](https://docs.oracle.com/de-de/iaas/developer-tutorials/tutorials/wp-on-ubuntu/01-summary.htm)

## Instanz erstellen
~~~
1. Image und Ausprägung 
    > Image > Canonical Ubuntu 20.04 "Immer kostenlos"
    > Shape > VM.Standard.A1.Flex "Immer kostenlos"
        > Anzahl OCPUs: 4
        Arbeitsspeicher (GB): 24 GB
2. Private Key speichern
3. Erstellen
~~~

## SSH Verbindung
~~~shell
ssh -i <your-private-key-file> ubuntu@<your-public-ip-address>
~~~

### Updates und Soft installieren
~~~shell
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
sudo apt-get install mc make
~~~


### Internetzugriff aktivieren

Der Assistent VM-Instanz erstellen erstellt automatisch ein VCN für Ihre VM. 
Fügen Sie dem Subnetz zwei Ingress-Regel hinzu, um Internetverbindungen auf Port 80 aud Port 443 zuzulassen.

~~~
> Virtual cloud network
    > Security List 
      > Default Security List for vcn-20220126-0920
      
        > Add Ingress Rule
          > Type: CIDR
          > Source: 0.0.0.0/0
          > Protocol: TCP
          > Source Port Range: all
          > Destination Port Range: 80
          > Description: HTTP
          
        > Add Ingress Rule
          > Type: CIDR
          > Source: 0.0.0.0/0
          > Protocol: TCP
          > Source Port Range: all
          > Destination Port Range: 443
          > Description: HTTP
~~~

Der Instanztraffic wird durch die Firewallregeln in jeder Instanz zusätzlich zu dieser Sicherheitsliste kontrolliert.

~~~shell
sudo iptables -I INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -I OUTPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT

sudo iptables -I INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -I OUTPUT -p tcp --sport 443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

sudo netfilter-persistent save
~~~

## Install Docker Engine
~~~shell
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker ${USER}
~~~

## Install Docker Compose
~~~shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# oder
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
~~~

## VM Neu starten
~~~shell
reboot now
~~~