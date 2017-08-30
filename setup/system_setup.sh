#!/bin/sh

#
# System setup script
#

set -e

echo " ===================================================== "
echo " === Executing system_setup.sh installation script === "
echo " ===================================================== "

#
# TODO - Enable color in pacman ( /etc/pacman.conf )
#
echo "Enabling color in pacman.conf..."
sudo sed -i "s/#Color/Color/" /etc/pacman.conf

echo "Updating official Arch Linux software repositories & packages..."
sudo pacman -Syyu

echo "Getting username variable..."
set $USER = whoami

echo "Current user: $USER"

echo "Installing prerequisites..."
sudo pacman -S wget expac curl yajl

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

#
# Get user GPU/VGA driver (& install)
#

echo "Installing Xorg & Mesa..."
pacaur --noconfirm --noedit -S \
  xorg-server \
  xorg-server-devel \
  xorg-xauth \
  xorg-xprop \
  xorg-xwininfo \
  xf86-input-libinput \
  xf86-video-amdgpu \
  vulkan-radeon \
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

echo "Installing Antigen, Termite, Neovim & Dein..."
pacaur --noconfirm --noedit -S \
  antigen-git \
  termite \
  neovim \
  vim-dein-git

echo "Installing i3..."
pacaur --noconfirm --noedit -S \
  dmenu \
  i3-gaps-git \
  i3lock \
  i3status \
  xcb-util-cursor \
  xcb-util-keysyms \
  xcb-util-wm \
  xcb-util-xrm \
  startup-notification

echo "Installing add-ons..."
pacaur --noconfirm --noedit -S \
  compton-git \
  conky \
  feh \
  libconfig \
  libnotify \
  numlockx \
  xclip \
  xdg-user-dirs

echo "Installing Ranger..."
pacaur --noconfirm --noedit -S \
  ranger \ 
  highlight \
  libcaca \
  mediainfo \
  perl-image-exiftool \
  poppler \
  poppler-glib \
  poppler-data \
  w3m

echo "Installing atool & dependencies..."
pacaur --noconfirm --noedit -S \
  atool \
  bzip2 \
  cpio \
  gzip \
  lzop \
  p7zip \
  tar \
  unace \
  unrar \
  unzip \
  xz \
  zip

echo "Installing file system tools..."
pacaur --noconfirm --noedit -S \
  gptfdisk \
  parted \
  ntfs-3g \
  dosfstools

echo "Installing ALSA & PulseAudio..."
pacaur --noconfirm --noedit -S \
  alsa-utils \
  ffmpeg \
  libcanberra \
  libcanberra-pulse \
  pulseaudio \
  pulseaudio-alsa \
  pulseaudio-ctl \
  speex
 
echo "Installing NetworkManager..."
pacaur --noconfirm --noedit -S \
  dnsmasq \
  dhclient \
  networkmanager

echo "Installing CUPS..."
pacaur --noconfirm --noedit -S \
  cups \
  ghostscript \
  gsfonts \
  libcups \
  hplip \
  sane \
  simple-scan

echo "Installing LightDM..."
pacaur --noconfirm --noedit -S \
  accountsservice \
  lightdm

echo "Installing Arc theme..."
pacaur --noconfirm --noedit -S \
  arc-icon-theme \
  arc-solid-gtk-theme

echo "Installing additional packages..."
pacaur --noconfirm --noedit -S \
  evince-light \
  firefox \
  flashplugin

echo "Enabling CUPS as service..."
sudo systemctl enable org.cups.cupsd.service

echo "Enabling NetworkManager as service..."
sudo systemctl enable NetworkManager.service

echo "Enabling LightDM as service..."
sudo systemctl enable lightdm.service

echo "Configuring LightDM..."
sudo sed -i "s/#autologin-user=/autologin-user=$USER/" /etc/lightdm/lightdm.conf
sudo sed -i "s/#autologin-user-timeout=0/autologin-user-timeout=0/" /etc/lightdm/lightdm.conf
sudo sed -i "s/#autologin-session=/autologin-session=i3/" /etc/lightdm/lightdm.conf
sudo sed -i "s/#greeter-setup-script=/greeter-setup-script=\/usr\/bin\/numlockx on/" /etc/lightdm/lightdm.conf

#
# TODO
# - Remove above replacements & add lightdm.conf to '/etc' directory
#

echo "Adding group 'autologin'..."
sudo groupadd -r autologin 

echo "Add current user to 'autologin' group..."
sudo gpasswd -a $USER autologin
