#!/bin/bash
read -p 'Do you want configure your softwares ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    sudo pacman -Rsc firefox hexchat || \
        sudo pacman -Syu && \
        sudo pacman -S git terminator vlc aria2 chromium bleachbit vim transmission \
        lldb valgrind zsh clang ccache python-pip clamav
fi

read -p 'Do you want install codecs ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab
fi

#Git configuration
read -p 'Do you want configure your git repositories ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
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
    if [ ! -d "./archives_extractor/" ]
    then
        git clone git@github.com:kalak-io/archives_extractor.git
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
    if [ ! -d "./archives_extractor" ]
    then
        git clone git@gitlab.com:kalak/archives_extractor.git
    fi

    cd ~/Documents/projects/

    #Creation du dossier professional
    if [ ! -d "./professional" ]; then
        echo "Create professionnal projects directory"
        mkdir ./professionnal 
    fi

    cd ~/Documents/projects/professionnal

    if [ ! -d "./retail_use_case_robot" ]
    then
        git clone git@gitlab.com:societe-generale/inno-lab/retail_use_case_robot.git
    fi
    if [ ! -d "./pepper_lab" ]
    then
        git clone git@gitlab.com:societe-generale/inno-lab/pepper_lab.git
    fi

    #Configuration gitignore_global
    rm ~/.gitignore_global
    ln -s ~/Documents/projects/personal/configuration/gitignore_global \
        ~/.gitignore_global && git config --global core.excludesfile ~/.gitignore_global
fi

read -p 'Do you want configure vim ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    #Configuration Vim
    rm -rf ~/.vimrc ~/.vim
    ln -s ~/Documents/projects/personal/configuration/vimrc ~/.vimrc
    mkdir ~/.vim && mkdir ~/.vim/bundle && cd ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git
    vim +PluginInstall +qall
fi

#Configuration zsh
read -p 'Do you want install oh-my-zsh ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm ~/.zshrc
    ln -s ~/Documents/projects/personal/configuration/zshrc ~/.zshrc
fi
