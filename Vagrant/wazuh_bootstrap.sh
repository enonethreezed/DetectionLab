#! /usr/bin/env bash

# https://documentation.wazuh.com/4.0/installation-guide/open-distro/all-in-one-deployment/unattended-installation.html

curl -so ~/all-in-one-installation.sh https://raw.githubusercontent.com/wazuh/wazuh-documentation/4.0/resources/open-distro/unattended-installation/all-in-one-installation.sh 
chmod 700 ~/all-in-one-installation.sh
sudo ~/all-in-one-installation.sh

