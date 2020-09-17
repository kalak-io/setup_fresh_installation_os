#! /usr/bin/env bash

echo "Installing AppImaged"
mkdir -p $HOME/Applications
cd $HOME/Applications

# Installation Appimaged to detect AppImage in specific folders
aria2c "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
chmod a+x appimaged-*.AppImage
./appimaged-x86_64.AppImage --install