#! /usr/bin/env bash

PACKAGES=(
    git
    base-devel
    a52dec
    faac
    faad2
    flac
    jasper
    lame
    libdca
    libdv
    libmad
    libxv
    wavpack
    x264
    xvidcore
    pamac-cli
    vlc
    libreoffice-still
    terminator
    firefox
    firefox-developer-edition
    chromium
    p7zip
    unrar
    tar
    rsync
    htop
    the_silver_searcher
    intel-ucode
    zsh
    linux-firmware
    vim
    docker
    xclip
    fzf
    python-pip
    python-virtualenv
    transmission-gtk
    tree
    gparted
    android-tools
    nodejs
    npm
    curl
    cmake
    make
    tlp
    ufw
    preload
    plank
)

# Choose pacman-mirrors
echo "Updating Pacman mirrors"
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syy --noconfirm

# Configure pacman with aria2
echo "Configuring Pacman with aria2"
sudo pacman -S --noconfirm --needed aria2
echo "XferCommand = /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u" | sudo tee -a /etc/pacman.conf

# Remove useless packages
echo "Removing useless packages"
sudo pacman -R midori manjaro-hello
sudo systemctl disable avahi-daemon

# Update
echo "Updating Pacman"
sudo pacman -Syu --noconfirm

# Install base packages
echo "Installing packages"
sudo pacman -S --noconfirm --needed ${PACKAGES[*]}

# Install AUR packages
echo "Installing AUR packages"
pamac build --no-confirm spotify

# Install programs
echo "Installing programs"
for f in programs/arch/*.sh; do
    bash "$f" -H;
done

# Configure ZRAM
echo "Configurong ZRAM"
sudo pamac install --no-confirm systemd-swap
sudo systemctl enable systemd-swap.service
sudo echo -e "zswap_enabled=1\nzram_enabled=0\nswapfc_enabled=1" > /etc/systemd/swap.conf.d/myswap.conf

# Configure Docker
echo "Configuring Docker"
sudo usermod -aG docker $LOGNAME
sudo systemctl enable docker
docker run hello-world

# Set swapiness
echo "Configurong Swapiness"
echo vm.swappiness=10 | sudo tee -a /etc/sysctl.d/100-manjaro.conf
sudo swapoff -a
sudo swapon -a

# Enable Preload
echo "Configuring Preload"
sudo systemctl enable preload

# Enable Firewall
echo "Configuring UFW"
sudo systemctl enable ufw.service
sudo ufw enable

# Enable TRIM
echo "Configuring TRIM"
sudo systemctl enable fstrim.timer

# Enable TLP
echo "Configuring TLP"
sudo systemctl enable tlp --now

