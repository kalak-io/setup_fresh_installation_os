#! /usr/bin/env bash

# Install Slack
echo "Installing Slack"
cd /tmp
git clone https://aur.archlinux.org/slack-desktop.git
cd slack-desktop/
makepkg -sri

