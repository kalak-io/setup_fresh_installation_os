#! /usr/bin/env bash

echo "Installing Node & npm"
npm config set prefix $HOME/.npm  
sudo chown -R $USER $HOME/.npm

echo "Installing Vue"
npm install -g vue
npm install -g @vue/cli
npm install -g nuxt

echo "Installing Gitmoji"
npm install -g gitmoji-cli

echo "Installing linting"
npm install -g eslint prettier eslint-plugin-vue 
