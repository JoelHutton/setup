#!/bin/bash
apt-get update
apt-get upgrade
#proprietary drivers
#dpkg -i dkms_2.2.0.3-2ubuntu3_all.deb

#install some useful programs
apt-get install -y vim-gnome
apt-get install -y skype
apt-get install -y vlc
apt-get install -y ubuntu-restricted-extras
#apt-get install chromium-browser
apt-get install -y git 
#go to download chrome page
#sudo -u joel chromium-browser https://www.google.com/chrome/browser/desktop/
#configure git email and name?
git config --global user.email "joel-hutton@hotmail.com" && git config --global user.name
apt-get install -y xclip 
apt-get install -y xsel 
apt-get install -y arduino
apt-get install -y tlp
apt-get install -y zsh
chsh -s /usr/bin/zsh
#get rc files from git?
mkdir -p /home/joel/git && cd /home/joel/git && git clone https://github.com/JoelHutton/vimrc.git && cd vimrc && ./setup.sh && cd .. && git clone https://github.com/JoelHutton/bashrc.git && cd bashrc && ./setup && cd .. && git clone https://github.com/JoelHutton/zshrc.git && cd zshrc && ./setup.sh
#change default editor
sudo update-alternatives --config editor
