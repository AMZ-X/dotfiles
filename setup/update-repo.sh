#! /bin/bash
#
# Used to copy user specific dotfiles to a branch in dotfiles repository
#

echo "Copying user files to repository..."
cp -v ~/.zshrc ../zshrc
cp -v ~/.Xresources ../Xresources
cp -v ~/.gtkrc-2.0 ../gtkrc-2.0

cp -v ~/.config/compton.conf ../config/compton.conf
cp -v ~/.config/conky/conkyrc ../config/conky/conkyrc
cp -v ~/.config/gtk-3.0/settings.ini ../config/gtk-3.0/settings.ini
cp -v ~/.config/i3/config ../config/i3/config
cp -v ~/.config/nvim/init.vim ../config/nvim/init.vim
# cp -v ~/.config/mpd ../config
cp -v ~/.config/termite/config ../config/termite/config
