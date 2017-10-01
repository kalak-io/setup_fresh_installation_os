#!/bin/bash

read -p 'Do you want configure vim ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
    #Configuration Vim
    rm -rf ~/.vimrc ~/.vim
    ln -s ~/Documents/projects/personal/configuration/myvimrc ~/.myvimrc
    echo "source ~/.myvimrc" >> ~/.vimrc
    mkdir -p ~/.vim
    mkdir -p ~/.vim/bundle
    cd ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git
    vim +PluginInstall +qall
    cd
fi

#Configuration zsh
read -p 'Do you want install oh-my-zsh ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "source ~/.myzshrc" >> ~/.zshrc
    ln -s ~/Documents/projects/personal/configuration/myzshrc ~/.myzshrc
fi
