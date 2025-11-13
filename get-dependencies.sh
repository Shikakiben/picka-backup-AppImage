#!/bin/sh

set -eu

echo "Installing basic dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	base-devel        \
	curl              \
	git               \
	libx11            \
	libxrandr         \
	libxss            \
	pulseaudio        \
	pulseaudio-alsa   \
	wget              \
	xorg-server-xvfb  \
	zsync

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#get-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here

# Finally we get the version of the application and put it in a version file
# If the app was installed with pacman it is as simple as the following:
# pacman -Q PACKAGENAME | awk '{print $2; exit}' > ./dist/version
