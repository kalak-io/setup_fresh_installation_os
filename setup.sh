#! /usr/bin/env bash

DISTRO=`lsb_release -is`
# Requirements
if [ $DISTRO == "Linuxmint" ] || [ $DISTRO == "Ubuntu" ]
then
    echo "Ubuntu base";
    sudo apt update && sudo apt install -y git
elif [ $DISTRO == "ManjaroLinux" ]
then
    echo "Manjaro";
    sudo pacman -Syy && yes | sudo pacman -S git
else
    echo "Unsupported distro";
    exit 2
fi

# Setup personal filesystem
echo "Create projects directory"
mkdir -p $HOME/Documents/projects/personal && cd $_
git clone https://github.com/kalak-io/setup_fresh_installation_os.git
cd $HOME/Documents/projects/personal/setup_fresh_installation_os/scripts
sudo chmod u+x ./*.sh ./programs/*.sh

# Install specific packages
if [ $DISTRO == "Ubuntu" ]
then
    echo "Ubuntu";
    ./ubuntu.sh
elif [ $DISTRO == "Linuxmint" ]
then
    echo "Linux Mint";
    ./linuxmint.sh
elif [ $DISTRO == "ManjaroLinux" ]
then
    echo "Manjaro";
    ./manjaro.sh
else
    echo "Unsupported distro";
fi

# Install common packages
for f in ./programs/common/*.sh; do
    bash "$f" -H;
done

./symlink.sh
./repositories.sh

echo "Finish ! You can reboot the system."
