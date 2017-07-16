#! /bin/bash
# 
# Copies dotfiles to user config
#

set -e

echo "Getting username variable..."
whoami > $USER

echo "Current user: $USER\n"

echo "Installing prerequisites for pacaur..."
sudo pacman -S git expac curl yajl

# Install cower (AUR)
echo "Installing cower..."
mkdir /tmp/tmp-cower
cd /tmp/temp-cower
wget https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=cower
makepkg
sudo pacman --noconfirm -U *.tar.xzd
cd -

# Install pacaur (AUR)
echo "Installing pacaur..."
mkdir /tmp/tmp-pacaur
cd /tmp/tmp-pacaur
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg
sudo pacman --noconfirm -U *.tar.xz
cd -

echo "Installing X11/Xorg..."
pacaur --noconfirm --noedit -S \
  xorg-server \
  xorg-server-devel \
  xorg-xauth \
  xorg-xprop \
  xorg-xwininfo \
  xf86-input-libinput \
  xf86-video-amdgpu 

echo "Installing fonts..."
pacaur --noconfirm --noedit -S \
  terminus-font \
  ttf-dejavu \
  ttf-droid \
  ttf-font-awesome \
  ttf-font-icons \
  ttf-freefont \
  ttf-inconsolata \
  ttf-liberation \
  ttf-roboto \
  ttf-symbola \
  ttf-ubuntu-font-family

echo "Installing AMD/Mesa drivers..."
pacaur --noconfirm --noedit -S \
  mesa \
  mesa-libgl \
  mesa-demos \
  mesa-vdpau \
  libglvnd \
  libva \
  libva-mesa-driver 

echo "Installing vim, vim-plug & antigen..."
pacaur --noconfirm --noedit -S \
  vim \
  antigen-git \
  vim-plug-git

echo "Installing i3..."
pacaur --noconfirm --noedit -S \
  i3-gaps-git \
  i3lock \
  i3lock-fancy-git \
  i3status-git \
  xcb-util-cursor \
  xcb-util-keysyms \
  xcb-util-wm \
  xcb-util-xrm \
  startup-notification

echo "Installing i3 add-ons..."
pacaur --noconfirm --noedit -S \
  compton-git \
  feh \
  libnotify \
  xclip

echo "Installing ranger..."
pacaur --noconfirm --noedit -S \
  ranger \
  atool \
  highlight \
  libcaca \
  mediainfo \
  perl-image-exiftool \
  poppler \
  poppler-glib \
  poppler-data \
  w3m

echo "Installing ALSA & PulseAudio..."
pacaur --noconfirm --noedit -S \
  alsa-utils \
  pulseaudio \
  pulseaudio-alsa \
  pulseaudio-ctl
  libcanberra \
  libcanberra-pulse

echo "Installing NetworkManager..."
pacaur --noconfirm --noedit -S \
  dhclient \
  networkmanager

echo "Enabling NetworkManager as service..."
sudo systemctl enable NetworkManager.service

echo "Installing CUPS..."
pacaur --noconfirm --noedit -S \
  cups \
  ghostscript \
  gsfonts \
  libcups \
  hplip \
  simple-scan

echo "Enabling CUPS as service..."
sudo systemctl enable org.cups.cupsd.service

echo "Installing NoDM..."
pacaur --noconfirm --noedit -S \
  nodm

echo "Enabling NoDM as service..."
sudo systemctl enable nodm.service

echo "Configuring NoDM..."
sudo sed -i "s/{user}/$USER/g" /etc/nodm.conf
sudo cp -v ./conf.d/nodm /etc/pam.d/nodm

echo "Installing Arc theme..."
pacaur --noconfirm --noedit -S \
  arc-icon-theme \
  arc-solid-gtk-theme

echo "Installing additional packages..."
pacaur --noconfirm --noedit -S \
  evince-light \
  firefox \
  thunderbird

echo "Setting up directories..."
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3
mkdir ~/.config/mpd
mkdir ~/.config/termite

echo "Copying files to $HOME directory..."
cp -v ./zshrc ~/.zshrc
cp -v ./vimrc ~/.vimrc
cp -v ./gtkrc-2.0 ~/.gtkrc-2.0
cp -v ./Xresources ~/.Xresources
cp -v ./xinitrc ~/.xinitrc

cp -vr ./config/ ~/.config

echo "Make ~/.xinitrc executable..."
sudo chmod +x ~/.xinitrc

echo "Done! :)"
