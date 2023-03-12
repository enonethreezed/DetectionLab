#!/usr/bin/env bash
# Go headless VirtualBox
sed -i 's/vb.gui = true/vb.gui = false/' Vagrant/Vagrantfile
