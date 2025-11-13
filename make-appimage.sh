#!/bin/sh

set -eu

export VERSION=$(cat ./dist/version)
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=PATH_OR_URL_TO_ICON
export DESKTOP=PATH_OR_URL_TO_DESKTOP_ENTRY
export OUTNAME="$APPNAME"-"$VERSION"-anylinux-"$ARCH".AppImage

# Deploy dependencies
quick-sharun /PATH/TO/BINARY_AND_LIBRARIES_HERE

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

mv -v ./*.AppImage* ./dist
