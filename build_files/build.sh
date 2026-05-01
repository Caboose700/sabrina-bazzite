#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux

### Undo Commit 0a76fac (https://github.com/ublue-os/bazzite/commit/0a76fac458a2b0fe6a947183e2a6b4e9ea79c039)
# Add QEMU and ROCM back to the image.
dnf5 -y install qemu \
		libvirt \
		guestfs-tools \
		rocm-hip \
		rocm-opencl \
		rocm-clinfo \

# Add Python 3 libaries and header files, as well as tkinter.
dnf5 -y install python3-devel \
		python3-tkinter \

# Add Conky
dnf5 -y install conky

# Add Wireshark
dnf5 -y install wireshark

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
