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
	sudo apt -y dist-upgrade
	sudo apt-get install -y ssh
	sudo systemctl start ssh.service
	sudo reboot
}

main() {
	reconfigure_locales
	install_ssh
}

main
exit 0

