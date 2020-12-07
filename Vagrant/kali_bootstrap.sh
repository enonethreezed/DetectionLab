#! /usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

reconfigure_locales() {
	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	locale-gen en_US.UTF-8
	dpkg-reconfigure locales
}

upgrade_system(){
	sudo apt update
	sudo apt -y dist-upgrade 
}

install_ssh() {
	sudo apt-get install -y ssh
	sudo systemctl start ssh.service
}

setupRDP(){
	sudo apt-get install -y kali-desktop-xfce xorg xrdp
	sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
	wget https://gitlab.com/kalilinux/build-scripts/kali-wsl-chroot/-/raw/master/xfce4.sh
	chmod +x xfce4.sh
	sudo ./xfce4.sh
	sudo systemctl enable xrdp --now
	echo "xfce4-session" > ~/.xsession
	cat <<EOF > ~/.xsessionrc
	export XDG_SESSION_DESKTOP=xubuntu
	export XDG_DATA_DIRS=${D}
	export XDG_CONFIG_DIRS=/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg
	EOF
	cat <<EOF | sudo tee /usr/bin/light-locker
	#!/bin/sh
	# The light-locker uses XDG_SESSION_PATH provided by lightdm.
	if [ ! -z "\${XDG_SESSION_PATH}" ]; then
  	/usr/bin/light-locker.orig
	else
  	# Disable light-locker in XRDP.
  	true
	fi
	EOF
}

main() {
	reconfigure_locales
	upgrade_system
	install_ssh
	setupRDP
}

main
exit 0