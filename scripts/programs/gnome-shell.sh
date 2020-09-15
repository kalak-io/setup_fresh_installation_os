#! /usr/bin/env bash

echo "Configuring Gnome shell"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'chromium_chromium.desktop', 'firefox.desktop', 'firefoxDeveloperEdition.desktop', 'slack.desktop', 'spotify.desktop']
