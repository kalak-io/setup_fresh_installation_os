#! /usr/bin/env bash

echo "Installing Balena Etcher"
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-fast update && sudo apt-fast install -y balena-etcher-electron
