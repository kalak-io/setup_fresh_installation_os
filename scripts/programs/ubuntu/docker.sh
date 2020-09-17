#! /usr/bin/env bash

echo "🐋 Installing Docker"
if [ `lsb_release -is` == "Ubuntu" ]
then
   CODENAME=`lsb_release -cs`
else
   CODENAME=focal
fi

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $CODENAME \
   stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $LOGNAME
sudo docker run hello-world
