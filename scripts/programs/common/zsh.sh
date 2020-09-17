#! /usr/bin/env bash

echo "Installing ZSH and Oh-my-zsh"
rm -rf $HOME/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/zshrc $HOME/.zshrc
