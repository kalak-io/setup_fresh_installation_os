#! /usr/bin/env bash

PPA="
    ppa:apt-fast/stable
    ppa:linrunner/tlp
"

APT_PACKAGES="
    ubuntu-restricted-extras
    curl
    chromium-browser
    make
    terminator
    vlc
    aria2
    tree
    bleachbit
    vim
    transmission-cli
    transmission-gtk
    htop
    gparted
    preload
    zsh
    tlp
    tlp-rdw
    spotify-client
    gcc
    build-essential
    simple-scan
    gnome-tweak-tool
    firefox-gnome-shell
    exfat-fuse
    exfat-utils
    python3-pip
    xclip
    rar
    unrar
    p7zip-full
    p7zip-rar
"

# Add tierce repository
for ppa in $PPA; do
    sudo apt-add-repository -y $ppa
done

sudo apt update

# Install apt-fast
sudo apt install -y apt-fast

# Remove useless packages
sudo apt purge -y ubuntu-web-launchers thunderbird

# Check for updates
sudo apt-fast full-upgrade -y

# Install packages
sudo apt-fast install -y $APT_PACKAGES

# Install programs
for f in programs/*.sh; do
    bash "$f" -H;
done

# Activate firewall
sudo ufw enable

# Activate tlp
sudo tlp start

# Clean Up system
sudo apt autoclean
sudo apt clean
sudo apt autoremove -y