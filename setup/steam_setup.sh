#
# ./setup/steam_setup.sh
#
# Installs Steam and required dependencies
#

#
# Uncomment multilib in /etc/pacman.conf
#
#
#
#keyword="[multilib]"
#
#while IFS= read -r line; do
#  [[ "$line" =~ $keyword ]] && line="${line#*#}"
#  printf "%s\n" "$line"
#done < /etc/network/interfaces > /tmp/interfaces_modified
#
#
#sudo sed -i "s/#[multilib]/[multilib]/" /etc/pacman.conf
#sudo sed -i "s/#"
#
# Get user GPU/VGA driver
#

pacaur --noconfirm --noedit -S \
    steam \
    steam-native-runtime \
    geoip \
    vulkan-radeon \
    lib32-vulkan-radeon \
    lib32-libglvnd \
    lib32-mesa \
    lib32-mesa-libgl \
    lib32-mesa-vdpau \
    lib32-libsamplerate \
    lib32-speex \
    lib32-libcanberra-pulse 
    
