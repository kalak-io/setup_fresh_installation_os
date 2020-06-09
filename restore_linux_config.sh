#!/bin/bash

COMMON_PACKAGES=(git terminator vlc aria2 tree bleachbit vim transmission-cli transmission-gtk htop gparted preload zsh)
BROWSER_PACKAGES=(chromium-browser)

CURRENT_OS=$(uname -o)
if [ "$CURRENT_OS == 'GNU/Linux'" ] && [ "$(uname -r | grep MANJARO)" ]; then
    read -rp 'Do you want install your softwares ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo pacman -Rsc hexchat empathy brasero evolution ms-office-online \
		jre8-openjdk steam-manjaro lollypop || \
	    sudo pacman -Syu && sudo pacman-mirrors -c France && \
	    sudo pacman -S $COMMON_PACKAGES[@] && \
	    sudo pacman -S base-devel tk lldb valgrind \
	    clang ccache clamav python-pip yaourt fuse-exfat util-linux \
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
	yaourt -S spotify slack-desktop vscodium-bin \
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
	sudo apt-add-repository ppa:apt-fast/stable -y && sudo apt-get update && sudo apt-get -y install apt-fast
	sudo apt-fast update && sudo apt-fast -y upgrade && \
	sudo apt-fast -y install $COMMON_PACKAGES[@] \
	    gcc build-essential cmake python3-dev \
	    ubuntu-restricted-extras simple-scan gnome-tweak-tool exfat-fuse \
	    exfat-utils
    fi

    read -rp 'Do you want install your Firefox Developer Edition ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	cd ~/Downloads/ && \
	aria2c https://download.mozilla.org/\?product\=firefox-devedition-latest-ssl\&os\=linux64\&lang\=en-US && \
	tar xjf firefox-*.tar.bz2 && \
	sudo mv firefox /opt/firefox-de && \
	sudo chown -R $USER /opt/firefox-de
	echo "Need to configure PATH 'export PATH=/opt/firefox-d/firefox:PATH' and MOVE .desktop in ~/.local/share/application"
    fi

    read -rp 'Do you want install snap packages ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo snap install slack --classic && \
	sudo snap istall spotify codium
    fi

    read -rp 'Do you want install Docker Engine ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo apt-fast -y install \
             apt-transport-https \
             ca-certificates \
             curl \
             gnupg-agent \
             software-properties-common && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
	sudo apt-key fingerprint 0EBFCD88 && \
	sudo add-apt-repository \
             "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
             $(lsb_release -cs) \
             stable" && \
	sudo apt-fast update && \
	sudo apt-fast -y install docker-ce docker-ce-cli containerd.io && \
	sudo usermod -aG docker $LOGNAME && \
	docker run hello-world
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

if [ "$CURRENT_OS == 'GNU/Linux'" ] ; then
    read -rp 'Do you want install Anaconda ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	wget --output-document=/tmp/anaconda.sh https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh /tmp/anaconda.sh
	sh /tmp/anaconda.sh
    fi
    read -rp 'Do you want to reboot ? Y or N ' answer
    if [ "$answer" = 'Y' ] || [ "$answer" = 'y' ]; then
	sudo reboot
    fi
fi
