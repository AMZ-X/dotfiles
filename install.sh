#!/bin/sh

#
# System-wide installation script
#

set -e

echo "Getting username variable..."
set $USER = whoami

echo "Current user: $USER"

echo "Installing prerequisites for pacaur..."
sudo pacman -S expac curl yajl

# Install cower (AUR)
echo "Installing cower..."
mkdir /tmp/tmp-cower
cd /tmp/tmp-cower
wget https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz 
tar -xvf cower.tar.gz
cd ./cower
makepkg -s --skippgpcheck
sudo pacman --noconfirm -U *.pkg.tar.xz
cd -

# Install pacaur (AUR)
echo "Installing pacaur..."
mkdir /tmp/tmp-pacaur
cd /tmp/tmp-pacaur
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz
tar -xvf pacaur.tar.gz
cd ./pacaur
makepkg -s --skippgpcheck
sudo pacman --noconfirm -U *.pkg.tar.xz
cd -

echo "Installing Xorg & Mesa..."
pacaur --noconfirm --noedit -S \
  xorg-server \
  xorg-server-devel \
  xorg-xauth \
  xorg-xprop \
  xorg-xwininfo \
  xf86-input-libinput \
  xf86-video-amdgpu \
  mesa \
  mesa-libgl \
  mesa-demos \
  mesa-vdpau \
  libglvnd \
  libva \
  libva-mesa-driver
  
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

echo "Installing GTK & Python..."
pacaur --noconfirm --noedit -S \
  gtk2 \
  gtk3 \
  gtk3-print-backends \
  python \
  python2

echo "Installing antigen, termite, vim & vim-plug..."
pacaur --noconfirm --noedit -S \
  antigen-git \
  termite \
  vim \
  vim-plug-git

echo "Installing i3..."
pacaur --noconfirm --noedit -S \
  dmenu \
  i3-gaps-git \
  i3lock \
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
  libconfig \
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
  pulseaudio-ctl \
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
  sane \
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
  thunderbird \
  parted \
  ntfs-3g \
  dosfstools \
  gptfdisk

echo "Setting up user directories..."
mkdir -v ~/Documents
mkdir -v ~/Downloads
mkdir -v ~/Music
mkdir -v ~/Movies
mkdir -v ~/Pictures
mkdir -v ~/Workspace

echo "Setting up config directories..."
mkdir -v ~/.config
mkdir -v ~/.config/gtk-3.0
mkdir -v ~/.config/i3
mkdir -v ~/.config/mpd
mkdir -v ~/.config/termite

echo "Copying config files..."
cp -v ./zshrc ~/.zshrc
cp -v ./vimrc ~/.vimrc
cp -v ./gtkrc-2.0 ~/.gtkrc-2.0
cp -v ./Xresources ~/.Xresources
cp -v ./xinitrc ~/.xinitrc

cp -vr ./config/ ~/.config

echo "Make ~/.xinitrc executable..."
sudo chmod +x ~/.xinitrc

echo "Done! :)"
