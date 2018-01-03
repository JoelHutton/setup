#!/bin/bash
set -x 

apt-get update
apt-get upgrade
#xps 13 specific
#dpkg -i dkms_2.2.0.3-2ubuntu3_all.deb
#cp BCM20702A1-0a5c-216f.hcd /lib/firmware/brcm/

#install some useful programs
apt-get install -y vim-gnome
apt-get install -y skype
apt-get install -y vlc
apt-get install -y ubuntu-restricted-extras
apt-get install chromium-browser
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
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client
#get rc files from git
git clone https://github.com/JoelHutton/vimrc.git
git clone https://github.com/JoelHutton/zshrc.git
#to make mouse thumb button explode windows
#xbindkeys, you will need to change explode shortcut to ctrl \
#to get keycodes use xev, to send them to the OS use xte
sudo apt install xbindkeys
sudo apt install xautomation
cp xbindkeysrc $HOME/.xbindkeysrc
sudo apt install unity-tweak-tool && unity-tweak-tool
sudo apt install libssl-dev
#make chrome always start in incognito
sed -i -e 's/google-chrome-stable/google-chrome-stable\ --incognito/g' /usr/share/applications/google-chrome.desktop
#change default editor
sudo update-alternatives --config editor
google-chrome-stable  https://www.privateinternetaccess.com/installer/download_installer_linux
echo '[Re-enable hibernate by default for login1]
  Identity=unix-user:*
  Action=org.freedesktop.login1.hibernate
  ResultActive=yes

[Re-enable hibernate for multiple users by default in logind]
  Identity=unix-user:*
  Action=org.freedesktop.login1.hibernate-multiple-sessions
  ResultActive=yes' > /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
#so caps and escape can be swapped
sudo apt-get install gnome-tweak-tool -y && gnome-tweak-tool
#Remember to enable workspaces, autohide taskbar, enable natural scrolling, 
#tap to click
