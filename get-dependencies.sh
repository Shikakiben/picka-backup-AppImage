#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#get-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here

# Finally we get the version of the application and put it in a version file
# If the app was installed with pacman it is as simple as the following:
# pacman -Q PACKAGENAME | awk '{print $2; exit}' > ./dist/version

