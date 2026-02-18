#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y blivet-gui btrfs-assistant btrfsmaintenance fastfetch hardinfo2 zenity gnome-themes-extra

wget https://github.com/zoncky/Silverblue/raw/refs/heads/main/stl_thumb/simple-thumbnailer-stl
wget https://github.com/zoncky/Silverblue/raw/refs/heads/main/stl_thumb/simple-thumbnailer-stl.thumbnailer
cp simple-thumbnailer-stl /usr/bin
cp simple-thumbnailer-stl.thumbnailer /usr/share/thumbnailers
chmod +x /usr/bin/simple-thumbnailer-stl
rm -f simple-thumbnailer-stl simple-thumbnailer-stl.thumbnailer

dnf5 remove -y yelp firefox firefox-langpacks gnome-tour gnome-system-monitor htop nvtop

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
