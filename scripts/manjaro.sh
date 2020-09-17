#! /usr/bin/env bash

# Choose pacman-mirrors
sudo pacman-mirrors -f 0 && sudo pacman -Syy

# Update
yes | sudo pacman -Syu

# Install base packages
yes | sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins pamac-cli vkc libreoffice firefox aria2 p7zip p7zip-plugins unrar tar rsync htop

# Install AUR packages
yes | sudo pamac install ttf-ms-fonts ufw tlp

# Install programs
for f in programs/arch/*.sh; do
    bash "$f" -H;
done

# Configure ZRAM

# Set swapiness
sudo echo vm.swappiness=10 > /etc/sysctl.d/100-manjaro.conf
sudo swapoff -a
sudo swapon -a

# Enable Firewall
sudo systemctl enable ufw.service
sudo ufw enable

# Enable TRIM
sudo systemctl enable fstrim.timer

# Enable TLP
sudo systemctl enable tlp --now

