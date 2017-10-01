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
fi

read -p 'Do you want install your python modules ? Y or N ' answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
    # Python install
    sudo python -m pip install flake8
fi

if [ "$os" == 'GNU/Linux' ] ; then
    read -p 'Do you want to reboot ? Y or N ' answer
    if [ $answer = 'Y' ] || [ $answer = 'y' ]; then
	sudo reboot
    fi
fi
