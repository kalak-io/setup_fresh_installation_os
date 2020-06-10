#! /usr/bin/env bash

echo "Installing Spotify"
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

sudo apt-fast install -y spotify-client