#! /bin/bash
#
# Used to copy user specific dotfiles to a branch in dotfiles repository
#

clear

echo "Copying user files to repository..."

cp -v ~/.gtkrc-2.0 ./gtkrc-2.0
cp -v ~/.zshrc ./zshrc
cp -v ~/.config/compton.conf ./config/compton.config

echo "Copying directories..."

cp -vr ~/.config/gtk-3.0 ./config
cp -vr ~/.config/i3 ./config
cp -vr ~/.config/mpd ./config
cp -vr ~/.config/termite ./config

