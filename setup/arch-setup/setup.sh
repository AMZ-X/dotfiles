#!/bin/sh

# Author: Christopher Crouse<amz.x@protonmail.com>
#

# Base Packages
BASE="
	
"

# Display Valid Arguments
displayValidArgs() {
	echo ""
	echo "VALID ARGUMENTS:"
	echo "--base				Installs base system"
	echo "--help				Display all possible arguments"
	echo ""
}

# Install Base System
installBaseSystem() {
	sudo pacman -S xorg-server \
	xorg-server-common \
	xorg-server-devel \
	xorg-server-xwayland \
	xorg-xrandr
} || {
	echo "Failed to install base system"
	exit 1
}


# Main
if [[ "$@" == *"--help"* ]]; then
	displayValidArgs
	exit
fi

# Update
echo "Updating..."
# sudo pacman -Syu

case "$@" in 
	"--base")
		installBaseSystem
		;;
	"--fuck")
		echo "FUCK"
		;;
	*)
		echo "'$*' - Unknown argument"
		;;
esac

