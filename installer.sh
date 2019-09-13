#!/usr/bin/env sh

build()
{
    git pull
    dpkg -b club.red-chair.cylinderaddons
}

case "$1" in
    "i" | "install")
        build
        su -c "dpkg -i club.red-chair.cylinderaddons.deb"
        rm club.red-chair.cylinderaddons.deb
    ;;
    "u" | "uninstall")
        su -c "dpkg -r club.red-chair.cylinderaddons"
    ;;
    "b" | "build")
        build
    ;;
    *)
        echo "This is the CylinderAddons build tool. It provides several commands for building, installing and uninstalling CylinderAddons."
        echo "Usage:"
        echo "	i, install	| Build and install CylinderAddons"
        echo "	u, uninstall	| Remove CylinderAddons from your system"
        echo "	b, build	| Build CylinderAddons without installing it"
    ;;
esac
