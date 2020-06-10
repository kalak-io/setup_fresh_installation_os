#! /usr/bin/env bash

# Dependencies
sudo apt update && sudo apt install -y git

# Setup personal filesystem
echo "Create projects directory"
mkdir -p $HOME/Documents/projects/personal && cd $_
git clone https://github.com/kalak-io/setup_fresh_installation_os.git
cd $HOME/Documents/projects/personal/setup_fresh_installation_os/scripts

sudo chmod u+x ./*.sh ./programs/*.sh

./symlink.sh
if [ "$(uname -a | grep Ubuntu)" ]; then
    ./ubuntu.sh
fi
./repositories.sh

echo "Finish ! You can reboot the system."