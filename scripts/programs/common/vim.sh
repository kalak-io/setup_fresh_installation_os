#! /usr/bin/env bash

echo "Configuring vim"
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall && python $HOME/.vim/bundle/youcompleteme/install.py --ts-completer
