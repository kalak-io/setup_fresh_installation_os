#! /usr/bin/env bash

echo "Installing Cozy Drive"
mkdir -p $HOME/Applications
cd $HOME/Applications

aria2c https://nuts.cozycloud.cc/download/channel/stable/64
chmod u+x Cozy-Drive-*.AppImage