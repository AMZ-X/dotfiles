#!/bin/sh
#
# User config setup
#

echo "Copying config files..."
cp -v ../zshrc ~/.zshrc
cp -v ../gtkrc-2.0 ~/.gtkrc-2.0
cp -v ../Xresources ~/.Xresources
cp -v ../xinitrc ~/.xinitrc
cp -vr ../config ~/.config

echo "Make ~/.xinitrc executable..."
sudo chmod +x ~/.xinitrc
