#! /usr/bin/env bash

PPA="
    ppa:apt-fast/stable
    ppa:linrunner/tlp
"

APT_PACKAGES=(
    ubuntu-restricted-extras
    curl
    cmake
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
    exfat-fuse
    exfat-utils
    python3-pip
    xclip
    rar
    unrar
    p7zip-full
    p7zip-rar
    zram-config
    adb
    libreoffice-writer
    libreoffice-calc
)

# Add tierce repository
for ppa in $PPA; do
    sudo apt-add-repository -y $ppa
done

sudo apt update

# Install apt-fast
sudo apt install -y apt-fast

# Remove useless packages
sudo apt purge -y ubuntu-web-launchers thunderbird

# Remove useless asian languages
sudo apt remove -y "fonts-kacst*" "fonts-khmeros*" fonts-lklug-sinhala fonts-guru-extra "fonts-nanum*" fonts-noto-cjk "fonts-takao*" fonts-tibetan-machine fonts-lao fonts-sil-padauk fonts-sil-abyssinica "fonts-tlwg-*" "fonts-lohit-*" fonts-beng-extra fonts-gargi fonts-gubbi fonts-gujr-extra fonts-kalapi "fonts-samyak*" fonts-navilu fonts-nakula fonts-orya-extra fonts-pagul fonts-sarai "fonts-telu*" "fonts-wqy*" "fonts-smc*" fonts-deva-extra fonts-sahadeva
sudo dpkg-reconfigure fontconfig

# Check for updates
sudo apt-fast full-upgrade -y

# Install packages
sudo apt-fast install -y ${APT_PACKAGES[*]}

# Install programs
for f in programs/*.sh; do
    bash "$f" -H;
done

# Activate firewall
sudo ufw enable

# Activate tlp
sudo tlp start

# Configure swapiness
sudo sysctl -w vm.swappiness=10
sudo swapoff -a
sudo swapon -a

# Activate zram
sudo service zram-config --full-restart

# Clean Up system
sudo apt autoclean
sudo apt clean
sudo apt autoremove -y
