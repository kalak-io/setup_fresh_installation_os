#!/bin/bash

os=`uname -o`
if [ "$os" == 'GNU/Linux' -a `uname -r | grep MANJARO` ]; then
    read -p 'Do you want install your softwares ? Y or N ' answer
    if [ $answer = 'Y' -o $answer = 'y' ]; then
	sudo pacman -Rsc firefox hexchat empathy brasero evolution || \
	    sudo pacman -Syu && \
	    sudo pacman -S git terminator vlc aria2 chromium pepper-flash \
	    bleachbit vim transmission-cli transmission-gtk lldb valgrind \
	    zsh clang ccache clamav python-pip yaourt fuse-exfat util-linux \
	    exfat-utils preload xorg-xprop p7zip unrar tar rsync arj \
	    cabextract rpmextract exfat-utils fuse-exfat a52dec faac faad2 \
	    flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora \
	    libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss \
	    libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab
    fi

    read -p 'Do you want optimize Pacman ? Y or N ' answer
    if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
	sudo pacman-db-upgrade && sudo pacman-optimize && sync
    fi

    read -p 'Do you want install your AUR softwares ? Y or N ' answer
    if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
	yaourt -S spotify slack-desktop syncthing syncthing-gtk \
	libinput-gestures ngrok docker docker-compose docker-machine \
	virtualbox qt5-x11extras nodejs ansible npm yarn nvm
	sudo gpasswd -a $USER input
	libinput-gestures-setup start
	libinput-gestures-setup autostart
    fi

    read -p 'Do you want change some permissions ? Y or N ' answer
    if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
	sudo usermod -aG log $LOGNAME
	sudo chown -R $LOGNAME /usr/share
	sudo gpasswd -a $LOGNAME wheel
	sudo systemctl enable fstrim.timer
    fi
else
    echo $os
    termux-setup-storage
    apt update && apt upgrade
    read -p 'Do you want install your softwares ? Y or N ' answer
    if [ $answer = 'Y' -o $answer = 'y' ]; then
	pkg install vim python git zsh 
fi

read -p 'Do you want install your python modules ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
    # Python install
    sudo python -m pip install flake8
fi

#Git configuration
read -p 'Do you want configure your git repositories ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
    git config --global user.name "cjacquem"
    git config --global user.email "cjacquem@student.42.fr"
    if [ -e "~/.ssh/id_rsa" ]; then
        ssh-keygen -t rsa -b 4096 -C "cjacquem@student.42.fr"
        eval "$ssh-agent -s)" && ssh-dd ~/.ssh/id_rsa
    fi
    read -p 'Did you add your ssh keys in git services ? Y or N ' answer
    if [ $answer = 'N' ] || [ $answer = 'n' ]; then
        exit 1
    fi

    echo "Create projects directory"
    mkdir -p ~/Documents
    mkdir -p ~/Documents/projects
    mkdir -p ~/Documents/projects/42
    mkdir -p ~/Documents/projects/personal

    cd ~/Documents/projects/42
    echo "Clone 42 projects"
    if [ ! -d "./libft/" ]; then
        git clone git@github.com:kalak-io/libft.git
    fi
    if [ ! -d "./ft_printf/" ]; then
        git clone --recursive -j8 git@github.com:kalak-io/ft_printf.git
    fi
    if [ ! -d "./computor_v1/" ]; then
        git clone git@github.com:kalak-io/computor_v1.git
    fi
    if [ ! -d "./docker-1/" ]; then
        git clone git@github.com:kalak-io/docker-1.git
    fi

    cd ~/Documents/projects/personal
    echo "Clone personal projects"
    if [ ! -d "./configuration/" ]; then
        git clone git@github.com:kalak-io/configuration.git
    fi
    if [ ! -d "./archives_extractor/" ]; then
        git clone git@github.com:kalak-io/archives_extractor.git
    fi
    if [ ! -d "./menu_generator/" ]; then
        git clone git@github.com:kalak-io/menu_generator.git
    fi
    if [ ! -d "./restore_config" ]; then
        git clone git@github.com:kalak-io/restore_config.git
    fi

    #Configuration gitignore_global
    rm ~/.gitignore_global
    ln -s ~/Documents/projects/personal/configuration/gitignore_global \
        ~/.gitignore_global && git config --global core.excludesfile ~/.gitignore_global
fi

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

if [ "$os" == 'GNU/Linux' ] ; then
    read -p 'Do you want to reboot ? Y or N ' answer
    if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
	sudo reboot
    fi
fi
