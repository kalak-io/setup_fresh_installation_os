#! /usr/bin/env bash

echo "Installing Vue.js"
sudo apt-fast install -y nodejs npm
npm config set prefix $HOME/.npm  
sudo chown -R $USER $HOME/.npm
npm install -g vue
npm install -g @vue/cli