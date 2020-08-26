#! /usr/bin/env bash

echo "🐍 Installing Python"
sudo apt-fast install -y python3-venv python3-pip
pip3 install pre-commit virtualenv virtualenvwrapper
