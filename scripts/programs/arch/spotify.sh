#! /usr/bin/env bash

echo "Installing Spotify"
yes | curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
yes | sudo pamac build spotify
1dd
