#! /bin/bash

# https://github.com/clong/DetectionLab/wiki/Quickstart-Linux

base=$PWD

# Make the Vagrant instances headless
cd $base/Vagrant || exit 1
sed -i 's/vb.gui = true/vb.gui = false/g' Vagrantfile
cd ..

# Make the Packer images headless
cd $base/Packer || exit 1
for file in *.json; do
  sed -i 's/"headless": false,/"headless": true,/g' "$file";
done
