#!/bin/sh
#
# User config setup
#

echo "Setting up user directories..."

mkdir -v ~/Documents
mkdir -v ~/Downloads
mkdir -v ~/Music
mkdir -v ~/Pictures
mkdir -v ~/Videos
mkdir -v ~/Workspace

echo "Copying config files..."
cp -v ../zshrc ~/.zshrc
cp -v ../vimrc ~/.vimrc
cp -v ../gtkrc-2.0 ~/.gtkrc-2.0
cp -v ../Xresources ~/.Xresources
cp -v ../xinitrc ~/.xinitrc
cp -vr ../config ~/.config

echo "Make ~/.xinitrc executable..."
sudo chmod +x ~/.xinitrc
