#! /bin/bash
#
# Used to copy user specific dotfiles to a branch in dotfiles repository
#

clear

echo "Copying user files to repository..."
cp -v ~/.zshrc ../zshrc
cp -v ~/.Xresources ../Xresources
cp -v ~/.gtkrc-2.0 ../gtkrc-2.0
cp -v ~/.config/gtk-3.0/settings.ini ../config/gtk-3.0/settings.ini
cp -v ~/.config/nvim/init.vim ../config/nvim/init.vim
cp -v ~/.config/compton.conf ../config/compton.conf

echo "Copying directories..."
cp -vr ~/.config/i3 ../config
cp -vr ~/.config/conky ../config
cp -vr ~/.config/mpd ../config
cp -vr ~/.config/termite ../config

