#!/usr/bin/env bash

# Variables
username=kalak

### CONFIGURING PACMAN ###
# Update pacman-mirrors
echo "Updating pacman mirrors"
pacman -Sy reflector --noconfirm
# Backup initial file
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Configure pacman with aria2
echo "Configuring Pacman with aria2"
pacman -S --noconfirm --needed aria2
echo "XferCommand = /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u" | tee -a /etc/pacman.conf

# Upgrading packages
echo "Upgrading packages"
pacman -Su --noconfirm

### CREATING USER ###
# Install sudo package
echo "Installing sudo package"
pacman -S sudo --noconfirm
echo "Create new user"
useradd -m -G wheel -s /bin/bash $username
passwd $username
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

# Switch root to user
echo "Switching to $username"
su $username

### AUR SUPPORT ###
# Install an AUR helper
echo "Installing auracle-git"
sudo pacman -S --noconfirm --needed base-devel git meson gtest gmock wget cmake fmt
cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz
tar -xzf auracle-git.tar.gz
cd auracle-git
export PATH=$PATH:/usr/bin/core_perl
makepkg PKGBUILD --skippgpcheck --noconfirm
sudo pacman -U --noconfirm auracle-git-*
echo "Installing AUR helper"
sudo pacman -S --noconfirm --needed binutils make gcc fakeroot expac yajl git
cd /tmp
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -si --noconfirm
cd

### INSTALLING PACKAGES ###
# Install base packages
echo "Installing system packages"
sudo pacman -S --noconfirm --needed base base-devel linux linux-firmware linux-lts linux-lts-headers intel-ucode wget curl networkmanager xf86-video-intel man man-db ufw clamav tlp thermald cronie systemd-swap bluez bluez-utils git vim zsh the_silver_searcher fzf openssh python-pip python-virtualenv nodejs npm transmission-cli docker terminator pulseaudio pulseaudio-alsa alsa-utils htop imagemagick

# Install codecs (a lot of codecs are dependencies of vlc)
echo "Installing codecs"
sudo pacman -S --noconfirm --needed vlc faac jasper libdv wavpack

# Install archives format
echo "Installing archives format"
sudo pacman -S --noconfirm --needed p7zip p7zip-plugins unrar tar rsync

# Install softwares
echo "Installing GUI softwares"
sudo pacman -S --noconfirm --needed bleachbit firefox firefox-developer-edition chromium libreoffice-still inkscape

# Install fonts
echo "Installing fonts"
sudo pacman -S --noconfirm --needed ttf-font-awesome ttf-ubuntu-font-family
pacaur -S --noedit --noconfirm --needed nerd-fonts-complete

# Install softwares from AUR
echo "Retrieving GPG keys"
sudo pacman -S --noconfirm --needed curl npm
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
echo "Installing softwares from AUR"
pacaur -S --noedit --noconfirm -needed spotify slack-desktop balena-etcher preload

# Configure Docker
echo "Configuring Docker"
sudo pacman -S --noconfirm --needed docker
sudo groupadd docker
sudo gpasswd -a $username docker
sudo systemctl enable docker
docker run hello-world
# Install Docker Compose
echo "Installing Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Installing npm packages
echo "Installing npm packages"
mkdir -p $HOME/.npm
npm config set prefix $HOME/.npm
sudo chown -R $USER $HOME/.npm

echo "Installing Vue"
npm install -g vue
npm install -g @vue/cli
npm install -g nuxt
npm install -g json-server

echo "Installing Gitmoji"
npm install -g gitmoji-cli

echo "Installing linting"
npm install -g eslint prettier eslint-plugin-vue

# Configuring Zsh
echo "Installing ZSH and Oh-my-zsh"
sudo pacman -S --noconfirm --needed zsh
rm -rf $HOME/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f $HOME/.zshrc $HOME/.zshrc.pre-oh-my-zsh
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/zshrc $HOME/.zshrc

echo "Configuring vim"
sudo pacman -S --noconfirm --needed vim
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall && python $HOME/.vim/bundle/youcompleteme/install.py --ts-completer

echo "Installing Python Packages"
pip3 install pre-commit virtualenv virtualenvwrapper

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

### DESKTOP ENVIRONMENT ###
# Install desktop environment
echo "Installing desktop environment packages"
## i3 (X)
sudo pacman -S --noconfirm --needed xorg i3-wm i3status i3lock rofi feh dunst scrot ranger xorg-xbacklight xclip conky
# redshift doesn't work under wayland
pacaur -S --noedit --noconfirm --needed redshift-minimal
sudo systemctl --user enable redshift.service
## sway (Wayland)
# sudo pacman -S --noconfirm --needed wayland sway waybar swaylock swayidle wofi ranger gammastep brightnessctl wclip mako grim wl-clipboard slurp
# Configuring dynamic wallpaper
# From: https://sylvaindurand.org/dynamic-wallpapers-with-sway/
# cd /tmp
# git clone https://git.durand.tf/sylvaindurand/lakeside.git
# mkdir -p ~/.config/sway
# cp -r ./lakeside/img ~/.config/sway/

# Configure display manager
echo "Installing display manager"
sudo pacman -S --noconfirm --needed vim
export VISUAL=/usr/bin/vim
export EXPORT=/usr/bin/vim
pacaur -S --noedit --noconfirm --needed ly
sed -i 's/^#hide_boders/hide_borders/' /etc/ly/config.ini
sed -i 's/^#load/load/' /etc/ly/config.ini
sed -i 's/^#save/save/' /etc/ly/config.ini
sudo systemctl enable ly.service

### ENABLING SERVICES ###
# Enable NetworkManager
sudo pacman -S --noconfirm --needed networkmanager
sudo systemctl enable NetworkManager

# Enable Firewall
echo "Configuring UFW"
sudo pacman -S  --noconfirm --needed ufw
sudo ufw enable
sudo systemctl enable ufw

# Enable Preload
echo "Configuring Preload"
pacaur -S --noedit --noconfirm --needed preload
sudo systemctl enable preload

# Enable TLP
echo "Configuring TLP"
sudo pacman -S --noconfirm --needed tlp
sudo tlp start
sudo systemctl enable tlp --now

# Enalbe Thermald
echo "Enabling Thermald"
sudo pacman -S --noconfirm --needed thermald
sudo systemctl enable thermald.service
sudo systemctl start thermald.service

# Enable bluetooth
echo "Enabling Bluetooth"
sudo pacman -S --noconfirm --needed bluez
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Enable TRIM
echo "Enabling TRIM"
sudo systemctl enable fstrim.timer

# Enable Cron
echo "Enabling cron"
sudo pacman -S --noconfirm --needed cronie
systemctl enable cronie

# Enable Clamav
echo "Configuring Clamav"
sudo pacman -S --noconfirm --needed clamav
sudo systemctl enable clamav-daemon.service
sudo systemctl start clamav-daemon.service
sudo freshclam

### CONFIGURING SWAP ###
# Configure swapiness
echo "Configuring swapiness"
sudo rm /etc/sysctl.d/99-swappiness.conf
echo vm.swappiness=5 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
echo vm.vfs_cache_pressure=50 | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo swapoff -a
sudo swapon -a

# Configure Systemd-swap
echo "Configuring systemd-swap"
sudo pacman -S --noconfirm --needed systemd-swap
sudo sed -i 's/^#zram_enabled=0/zram_enabled=1/' /etc/systemd/swap.conf
sudo sed -i 's/^#swapfc_enabled=0/swapfc_enabled=1/' /etc/systemd/swap.conf
sudo systemctl enable --now systemd-swap
echo "/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab
sudo swapoff -a
sudo swapon -a

echo "Finished!"
echo "You can launch the next scripts : Symlinks, repositories, scale_spotify..."
