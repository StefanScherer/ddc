#!/bin/bash
curl -s 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e' | sudo apt-key add --import
sudo apt-get update && sudo apt-get install -y apt-transport-https
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
echo "deb https://packages.docker.com/1.13/apt/repo ubuntu-trusty testing" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update && sudo apt-get install -y docker-engine
sudo usermod -a -G docker $USER
sudo usermod -a -G docker vagrant
