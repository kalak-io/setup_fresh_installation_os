#! /usr/bin/env bash

echo "Configuring Gnome shell"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
