#!/usr/bin/env bash

echo "Installing sway config"
echo "MOZ_ENABLE_WAYLAND=1" | sudo tee -a /etc/environment
# Install wallpapers
mkdir $HOME/.config/sway
cd $HOME/.config/sway
# Need to move the data in the right path
git clone https://git.durand.tf/sylvaindurand/lakeside.git
