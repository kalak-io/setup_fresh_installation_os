#! /usr/bin/env bash

echo "Installing Slack"
aria2c https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.3-amd64.deb
sudo apt install -y ./slack-desktop-*.deb && rm -f ./slack-desktop-*.deb