#!/bin/bash
set -x 

apt update
apt upgrade
#xps 13 specific
#dpkg -i dkms_2.2.0.3-2ubuntu3_all.deb
#cp BCM20702A1-0a5c-216f.hcd /lib/firmware/brcm/

#install some useful programs
apt install -y vim-gnome
apt install -y skype
apt install -y vlc
apt install -y ubuntu-restricted-extras
apt install -y git 
apt install -y sshfs
apt install -y chromium-browser
#go to download chrome page
#sudo -u joel chromium-browser https://www.google.com/chrome/browser/desktop/
#sudo -u joel chromium-browser https://www.skype.com/en/get-skype/ 
#configure git email and name?
git config --global user.email "Joel.Hutton@Arm.com" && git config --global user.name
apt install -y gcc
apt install -y make
apt install -y zsh
chsh -s /usr/bin/zsh
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt update
# 4. Install Spotify
sudo apt install spotify-client
pushd
cd ~
mkdir git
cd git
#get rc files from git
git clone https://github.com/JoelHutton/vimrc.git
git clone https://github.com/JoelHutton/zshrc.git
popd
#to make mouse thumb button explode windows
#xbindkeys, you will need to change explode shortcut to ctrl \
#to get keycodes use xev, to send them to the OS use xte
sudo apt install xbindkeys
sudo apt install xautomation
cp xbindkeysrc $HOME/.xbindkeysrc
sudo apt install libssl-dev
##make chrome always start in incognito
#sed -i -e 's/google-chrome-stable/google-chrome-stable\ --incognito/g' /usr/share/applications/google-chrome.desktop
#change default editor
sudo update-alternatives --config editor
google-chrome-stable  https://www.privateinternetaccess.com/installer/download_installer_linux
#echo '[Re-enable hibernate by default for login1]
#  Identity=unix-user:*
#  Action=org.freedesktop.login1.hibernate
#  ResultActive=yes
#
#[Re-enable hibernate for multiple users by default in logind]
#  Identity=unix-user:*
#  Action=org.freedesktop.login1.hibernate-multiple-sessions
#  ResultActive=yes' > /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
#so caps and escape can be swapped
sudo apt install gnome-tweak-tool -y && gnome-tweak-tool
#Remember to enable workspaces, autohide taskbar, enable natural scrolling, 
#tap to click
