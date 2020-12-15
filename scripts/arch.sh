#!/usr/bin/env bash

# Choose pacman-mirrors
echo "Updating pacman mirrors"
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Sy --noconfirm

# Configure pacman with aria2
echo "Configuring Pacman with aria2"
sudo pacman -S --noconfirm --needed aria2
echo "XferCommand = /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u" | sudo tee -a /etc/pacman.conf

# Upgrading packages
echo "Upgrading packages"
sudo pacman -Su --noconfirm

# Install an AUR helper
echo "Installing auracle-git"
sudo pacman -S --noconfirm --needed base-devel git meson gtest gmock wget
cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz
tar -xzf auracle-git.tar.gz
cd auracle-git
makepkg PKGBUILD --skippgpcheck --noconfirm
sudo pacman -U --noconfirm auracle-git-*
echo "Installing AUR helper"
sudo pacman -S --noconfirm--needed binutils make gcc fakeroot expac yajl git
cd /tmp
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -si --noconfirm
cd

# Install base packages
echo "Installing system packages"
sudo pacman -S --noconfirm --needed base base-devel linux linux-firmware linux-lts linux-lts-headers intel-ucode wget curl networkmanager xf86-video-intel

# Install dev tools
echo "Installing dev tools"
sudo pacman -S --noconfirm --needed git vim zsh terminator the_silver_searcher fzf docker python-pip python-virtualenv nodejs npm

# Install fonts
echo "Installing fonts"

# Install desktop environment
echo "Installing desktop environment packages"
sudo pacman -S --noconfirm --needed xorg i3-wm i3status i3lock rofi feh dunst

# Configure display manager
echo "Installing display manager"
pacaur -S --noedit --noconfirm --needed ly
sed -i 's/^#hide_boders/hide_borders/' /etc/ly/config.ini
sed -i 's/^#load/load/' /etc/ly/config.ini
sed -i 's/^#save/save/' /etc/ly/config.ini
sudo systemctl enable ly.service

# Install browsers
echo "Installing browsers"
sudo pacman -S --noconfirm --needed firefox firefox-developer-edition chromium

# Install utilities
echo "Installing utilities"
sudo pacman -S --noconfirm --needed ufw preload clamav tlp thermald cronie systemd-swap bluez
pacaur -S --noedit --noconfirm --needed redshift-minimal

# Install softwares
echo "Installing other softwares"
sudo pacman -S --noconfirm --needed libreoffice-still transmission-cli
pacaur -S --noedit --noconfirm -needed spotify sunway slack-desktop balena-etcher

# Install codecs (a lot of codecs are dependencies of vlc)
echo "Installing codecs"
sudo pacman -S --noconfirm --needed vlc faac jasper libdv wavpack

# Install archives format
echo "Installing archives format"
sudo pacman -S --noconfirm --needed p7zip p7zip-plugins unrar tar rsync

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
sudo pacman install --noconfirm --needed tlp
sudo tlp start
sudo systemctl enable tlp --now

# Enalbe Thermald
echo "Enabling Thermald"
sudo pacman install --noconfirm --needed thermald
sudo systemctl enable thermald.service
sudo systemctl start thermald.service

# Enable bluetooth
echo "Enabling Bluetooth"
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Enable TRIM
echo "Enabling TRIM"
sudo systemctl enable fstrim.timer

# Enable Cron
echo "Enabling cron"
sudo pacman -S --noconfirm --needed cronie
systemctl enable cronie

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

# Enable Clamav
echo "Configuring Clamav"
sudo pacman -S --noconfirm --needed clamav
sudo systemctl enable clamav-daemon.service
sudo systemctl start clamav-daemon.service
sudo freshclam

# Configure Docker
echo "Configuring Docker"
sudo pacman -S --noconfirm --needed docker
sudo usermod -aG docker $LOGNAME
sudo systemctl enable docker
docker run hello-world
# Install Docker Compose
echo "Installing Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Finished!"
