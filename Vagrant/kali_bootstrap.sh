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
	sudo apt -y -o Dpkg::Options::="--force-confdef" \ 
	-o Dpkg::Options::="--force-confold" dist-upgrade 
	sudo apt -y dist-upgrade
	sudo apt -y autoremove --purge
	sudo apt remove --purge $(sudo dpkg -l | grep "^rc" | awk '{print $2}' | tr '\n' ' ')
	sudo apt clean all
}

install_ssh() {
	sudo apt-get install -y ssh
	sudo systemctl start ssh.service --now
}

setupRDP(){
	sudo apt-get install -y kali-desktop-xfce xorg xrdp
	sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
	wget https://gitlab.com/kalilinux/build-scripts/kali-wsl-chroot/-/raw/master/xfce4.sh
	chmod +x xfce4.sh
	sudo ./xfce4.sh
	sudo systemctl enable xrdp --now
	echo "xfce4-session" > ~/.xsession
	echo "export XDG_SESSION_DESKTOP=xubuntu" >> /home/vagrant/.xsessionrc 
	echo "export XDG_DATA_DIRS=${D}" >> /home/vagrant/.xsessionrc
	echo "export XDG_CONFIG_DIRS=/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg" >> /home/vagrant/.xsessionrc
}

main() {
	reconfigure_locales
	upgrade_system
	install_ssh
	# setupRDP
}

main
exit 0
