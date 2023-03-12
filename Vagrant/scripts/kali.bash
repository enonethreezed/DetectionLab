#! /usr/bin/env bash

echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf
# echo 'nameserver 192.168.56.11' >> /etc/resolv.conf

apt-mark hold linux-image-amd64 grub-pc
DEBIAN_FRONTEND=noninteractive apt -yq update 
DEBIAN_FRONTEND=noninteractive apt -yq upgrade
DEBIAN_FRONTEND=noninteractive apt -yq install covenant-kbx
DEBIAN_FRONTEND=noninteractive apt -yq git build-essential apt-utils cmake libfontconfig1 libglu1-mesa-dev libgtest-dev libspdlog-dev libboost-all-dev libncurses5-dev libgdbm-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev mesa-common-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5websockets5 libqt5websockets5-dev qtdeclarative5-dev golang-go qtbase5-dev libqt5websockets5-dev libspdlog-dev python3-dev libboost-all-dev mingw-w64 nasm

msfdb init


