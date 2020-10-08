#! /usr/bin/env bash

PACKAGES=(
    python
    vim
    zsh
    aria2
    openssh
    fzf
)

# Update packages
echo "Updating packages"
pkg update && pkg upgrade -y

# Enable storage
echo "Enable access storage"
termux-setup-storage

# Install packages
pkg install -y ${PACKAGES[*]}
