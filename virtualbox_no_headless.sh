#!/usr/bin/env bash
# Go headless VirtualBox
sed -i 's/vb.gui = false/vb.gui = true/' Vagrant/Vagrantfile
