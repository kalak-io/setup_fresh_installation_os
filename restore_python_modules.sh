#!/bin/bash

if [ ! -d "~/Documents/projects/personal/configuration/" ]; then
    pip install --upgrade pip \
    && pip install --no-cache-dir -r ~/Documents/projects/personal/configuration/requirements.pip
fi
