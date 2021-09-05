#! /usr/bin/env bash

echo "Configuring Neovim"
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/nvim $HOME/.config/nvim
nvim -c PackerSync &
nvim -c TSInstallSync &
