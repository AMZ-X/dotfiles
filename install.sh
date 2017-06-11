#! /bin/bash
# 
# Copies dotfiles to user config
#

echo "Setting up directories..."

# Make directories
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3
mkdir ~/.config/mpd
mkdir ~/.config/termite

echo "Copying files to $HOME directory..."

# Copy dotfiles to respective directories
cp -v ./zshrc ~/.zshrc
cp -v ./gtkrc-2.0 ~/.gtkrc-2.0
cp -v ./config/compton.conf ~/.config/compton.conf

cp -vr ./config/i3 ~/.config
cp -vr ./config/gtk-3.0 ~/.config 
cp -vr ./config/mpd ~/.config
cp -vr ./config/termite ~/.config


