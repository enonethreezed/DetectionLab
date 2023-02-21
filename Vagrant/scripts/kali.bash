#! /usr/bin/env bash

echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf
# echo 'nameserver 192.168.56.11' >> /etc/resolv.conf

apt-mark hold linux-image-amd64 grub-pc
DEBIAN_FRONTEND=noninteractive apt -yq update 
DEBIAN_FRONTEND=noninteractive apt -yq upgrade
DEBIAN_FRONTEND=noninteractive apt -yq install covenant-kbx

msfdb init


