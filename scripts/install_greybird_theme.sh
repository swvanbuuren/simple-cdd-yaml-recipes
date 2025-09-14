#!/bin/sh
REQUIRED_PACKAGES="git autoconf libgdk-pixbuf-2.0-dev libglib2.0-bin librsvg2-dev meson ruby-sass sassc"
apt-get -y update
NEWLY_INSTALLED_PACKAGES=$(apt-get install --simulate $REQUIRED_PACKAGES \
| awk '
/^The following NEW packages will be installed:/ {c = 1; next}
c && /^[[:space:]]/ { gsub(/^[[:space:]]+|[[:space:]]+$/, ""); s = s ? s " " $0 : $0; next }
c { if (s) { print s; c = 0 } exit }
END { if (c && s) print s }
')
apt-get install --no-install-recommends -y $REQUIRED_PACKAGES
git clone https://github.com/shimmerproject/Greybird.git
cd Greybird
meson --prefix=/usr builddir
cd builddir
ninja
ninja install
cd ..
rm -rf Greybird
apt-get purge -y $NEWLY_INSTALLED_PACKAGES
