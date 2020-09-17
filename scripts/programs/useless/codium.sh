#! /usr/bin/env bash

ADDONS="
    formulahendry.auto-close-tag
    formulahendry.auto-complete-tag
    formulahendry.auto-rename-tag
    coenraads.bracket-pair-colorizer-2
    dbaeumer.vscode-eslint
    xabikos.javascriptsnippets
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    esbenp.prettier-vscode
    ms-python.python
    octref.vetur
    sdras.vue-vscode-snippets
    emmanuelbeziat.vscode-great-icons
"

echo "⌨️ Installing VSCodium"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

sudo apt-fast update
sudo apt-fast install -y codium

for a in $ADDONS; do
    codium --install-extension $a --force;
done
