#! /usr/bin/env bash

echo "🐍 Installing Python Packages"
pip3 install pre-commit virtualenv virtualenvwrapper

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
