#!/usr/bin/env bash

echo "Creating symlinks"
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/i3 $HOME/.config/i3
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/i3status $HOME/.config/i3status
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/rofi $HOME/.config/rofi
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/dunst $HOME/.config/dunst

echo "Installing Barista"
curl -L https://git.io/fA7iT -o $HOME/Documents/projects/personal/setup_fresh_installation_os/config/barista
sudo cmhod +x $HOME/Documents/projects/personal/setup_fresh_installation_os/config/barista
