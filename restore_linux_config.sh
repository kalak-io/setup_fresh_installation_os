#!/bin/bash

os=$(uname -o)
if [ "$os == 'GNU/Linux'" ] && [ "$(uname -r | grep MANJARO)" ]; then
    read -rp 'Do you want install your softwares ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo pacman -Rsc hexchat empathy brasero evolution ms-office-online \
		jre8-openjdk steam-manjaro lollypop || \
	    sudo pacman -Syu && sudo pacman-mirrors -c France && \
	    sudo pacman -S base-devel git terminator vlc aria2 tree tk \
	    bleachbit vim transmission-cli transmission-gtk lldb valgrind \
	    zsh clang ccache clamav python-pip yaourt fuse-exfat util-linux \
	    exfat-utils preload xorg-xprop p7zip unrar tar rsync arj \
	    cabextract rpmextract exfat-utils fuse-exfat a52dec faac faad2 \
	    flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora \
	    libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss \
	    libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab
    fi

    read -rp 'Do you want optimize Pacman ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo pacman-db-upgrade && sudo pacman-optimize && sync
    fi

    read -rp 'Do you want install your AUR softwares ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	yaourt -S spotify slack-desktop \
	docker docker-compose docker-machine \
	virtualbox powerpill
    fi

    read -rp 'Do you want change some permissions ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo usermod -aG log "$LOGNAME"
	sudo chown -R "$LOGNAME" /usr/share
	sudo gpasswd -a "$LOGNAME" wheel
	sudo systemctl enable fstrim.timer
    fi
elif [ "$(uname -a | grep Ubuntu)" ]; then
    read -rp 'Do you want install your softwares ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo apt install vlc gparted bleachbit transmission-gtk vim \
	    preload gcc build-essential cmake python3-dev && \
	sudo snap install ubuntu-restricted-extra spotify slack telegram htop
    fi
fi

read -rp 'Do you want install your python modules ? Y or N ' answer
if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
    pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r ./requirements.pip
fi

read -rp 'Do you want install torrench ? Y or N ' answer
if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
    python3 -m pip install --upgrade torrench --user
    mkdir ~/.config/torrench && cd ~/.config/torrench || return
    wget http://s000.tinyupload.com/download.php?file_id=12737623922646772242&t=1273762392264677224298814 -O config.ini
    sed -i 's/enable = 0/enable = 1/g' config.ini
    wget https://raw.githubusercontent.com/kryptxy/torrench/master/torrench.ini -O torrench.ini
    cd "$HOME" || return
fi

if [ "$os == 'GNU/Linux'" ] ; then
    read -rp 'Do you want to reboot ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo reboot
    fi
fi
