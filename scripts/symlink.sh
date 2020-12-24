#! /usr/bin/env bash

# Symlinks
# .gitconfig
rm -f $HOME/.gitconfig
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/gitconfig $HOME/.gitconfig
# .gitignore_global
rm -f $HOME/.gitignore_global
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global
# .gitmessage
rm -f $HOME/.gitmessage
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/gitmessage $HOME/.gitmessage
# libinput-gestures.conf
rm -rf $HOME/.config/libinput-gestures.conf
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/libinput-gestures.conf $HOME/.config/libinput-gestures.conf
# terminator
rm -rf $HOME/.config/terminator
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/terminator $HOME/.config/terminator
# transmission
rm -rf $HOME/.config/transmission
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/transmission $HOME/.config/transmission
# i3
rm -rf $HOME/.config/i3
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/i3 $HOME/.config/i3
rm -rf $HOME/.config/i3status
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/i3status $HOME/.config/i3status
rm -rf $HOME/.config/dunst
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/dunst $HOME/.config/dunst
# redshift
rm -rf $HOME/.config/redshift
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/redshift $HOME/.config/redshift
# conky
rm -rf $HOME/.config/conky
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/conky $HOME/.config/conky
# Xresources
rm -rf $HOME/.Xresources
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/Xresources $HOME/.Xresources
# rofi
ln -s $HOME/Documents/projects/personal/setup_fresh_installation_os/config/ $HOME/.config/rofi
