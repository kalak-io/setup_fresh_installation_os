#! /usr/bin/env bash

echo "Installing Gestures"
# Dependencies
sudo gpasswd -a $USER input
sudo apt install -y libinput-tools xdotool

# Installation Gestures
cd
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
sudo ./libinput-gestures-setup install && cd .. && rm -rf libinput-gestures

# Installation Gestures GUI
cd
git clone https://gitlab.com/cunidev/gestures
cd gestures
sudo python3 setup.py install && cd .. && rm -rf gestures

# Run on startup
libinput-gestures-setup autostart
libinput-gestures-setup start
