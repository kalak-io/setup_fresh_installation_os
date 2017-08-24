#!/bin/bash
sudo pacman -Rsc firefox hexchat || \
    sudo pacman -Syu && \
    sudo pacman -S git terminator vlc aria2 chromium bleachbit vim transmission \
    lldb valgrind zsh

#Git configuration
git config --global user.name "cjacquem"
git config --global user.email "cjacquem@student.42.fr"
if [ -e "~/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "cjacquem@student.42.fr"
    eval "$ssh-agent -s)" && ssh-dd ~/.ssh/id_rsa
fi
read -p 'Did you add your ssh keys in git services ? Y or N ' answer
if [ $answer = 'N' ] || [ $answer = 'n' ]
then
    exit 1
fi

cd ~/Documents/
#Creation du dossier projects
if [ ! -d "./projects/" ]
then
    echo "Create projects directory"
    mkdir ./projects
fi

cd ~/Documents/projects/

#Creation du dossier 42
if [ ! -d "./42/" ]; then 
    echo "Create 42 projects directory"
    mkdir ./42
fi

cd ~/Documents/projects/42

if [ ! -d "./libft/" ]
then
    git clone git@github.com:kalak-io/libft.git
fi
if [ ! -d "./ft_printf/" ]
then
    git clone git@github.com:kalak-io/ft_printf.git
fi

cd ~/Documents/projects/

#Creation du dossier personal
if [ ! -d "./personal" ]; then
    echo "Create personal projects directory"
    mkdir ./personal
fi

cd ~/Documents/projects/personal

if [ ! -d "./configuration/" ]
then
    git clone git@github.com:kalak-io/configuration.git
fi
if [ ! -d "./menu_generator/" ]
then
    git clone git@github.com:kalak-io/menu_generator.git
fi
if [ ! -d "./pepper_dialog_generator/" ]
then
    git clone git@gitlab.com:kalak/pepper_dialog_generator.git
fi
if [ ! -d "./pepper_conjugation_generator/" ]
then
    git clone git@gitlab.com:kalak/pepper_conjugation_generator.git
fi
if [ ! -d "./pepper_complete_lexicon/" ]
then
    git clone git@gitlab.com:kalak/pepper_complete_lexicon.git
fi

cd ~/Documents/projects/

#Creation du dossier professional
if [ ! -d "./professional" ]; then
    echo "Create professionnal projects directory"
    mkdir ./professionnal 
fi

#cd ~/Documents/projects/professionnal
# adding professionnal repositories

#Configuration Vim
rm -rf ~/.vimrc ~/.vim
ln -s ~/Documents/projects/personal/configuration/vimrc ~/.vimrc
mkdir ~/.vim && mkdir ~/.vim/bundle && cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall

#Configuration gitignore_global
rm ~/.gitignore_global
ln -s ~/Documents/projects/personal/configuration/gitignore_global \
    ~/.gitignore_global && git config --global core.excludesfile ~/.gitignore_global

#Configuration zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/Documents/projects/personal/configuration/zshrc ~/.zshrc
