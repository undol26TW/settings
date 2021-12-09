#!/bin/bash

# vscode
echo "vscode install"
sudo apt-get update
wget -O "code.deb" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i code.deb
rm -rf code.deb
sudo apt-get update code
echo "************************************"
echo ""
