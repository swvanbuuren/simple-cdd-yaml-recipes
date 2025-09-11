#!/bin/sh
REQUIRED_PACKAGES="autoconf libgdk-pixbuf-2.0-dev libglib2.0-bin librsvg2-dev meson ruby-sass sassc"
apt-get -y update
apt-get install --no-install-recommends -y $REQUIRED_PACKAGES
git clone https://github.com/shimmerproject/Greybird.git
cd Greybird
meson --prefix=/usr builddir
cd builddir
ninja
ninja install
cd ..
rm -rf Greybird
apt-get install purge -y $REQUIRED_PACKAGES
apt-get autoremove -y
