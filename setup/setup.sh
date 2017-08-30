# !/bin/sh
#
# Setup script
#

set -e

pre_installation_configuration() {
  
  echo "Pre-install configuration..."
  
  echo "Enabling color in pacman.conf..."
  sudo sed -i "s/#Color/Color/" /etc/pacman.conf

}


install_prerequisites() {
  
  echo "Installing prerequisites..."
  sudo pacman -S wget expac curl yajl

  echo "Installing cower (AUR)..."
  mkdir /tmp/tmp-cower
  cd /tmp/tmp-cower
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/cower.tar.gz 
  tar -xvf cower.tar.gz
  cd ./cower
  makepkg -s --skippgpcheck
  sudo pacman --noconfirm -U *.pkg.tar.xz
  cd -

  echo "Installing pacaur..."
  mkdir /tmp/tmp-pacaur
  cd /tmp/tmp-pacaur
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz
  tar -xvf pacaur.tar.gz
  cd ./pacaur
  makepkg -s --skippgpcheck
  sudo pacman --noconfirm -U *.pkg.tar.xz
  cd -

}

system_installation() {
  
  

}

enable_color_in_pacman() {

  echo "Enabling color in pacman.conf..."
  sudo sed -i "s/#Color/Color/" /etc/pacman.conf 

}
