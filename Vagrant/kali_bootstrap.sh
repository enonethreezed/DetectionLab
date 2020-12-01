#! /usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

reconfigure_locales() {
	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	locale-gen en_US.UTF-8
	dpkg-reconfigure locales
}

install_ssh() {
	sudo apt update
	sudo apt -y dist-upgrade --force-yes
	sudo apt-get install --force-yes ssh
	sudo systemctl start ssh.service
	sudo reboot
}

setupRDP(){
	sudo apt-get install --yes --force-yes kali-desktop-xfce xorg xrdp
	sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
	wget https://gitlab.com/kalilinux/build-scripts/kali-wsl-chroot/-/raw/master/xfce4.sh
	chmod +x xfce4.sh
	sudo ./xfce4.sh
	sudo systemctl enable xrdp --now
}

main() {
	reconfigure_locales
	install_ssh
	setupRDP
}

main
exit 0