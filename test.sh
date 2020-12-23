#!/usr/bin/env bash

resolutions=$(xdpyinfo | awk '/dimensions/ {print $2}')
echo $resolutions
