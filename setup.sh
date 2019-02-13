#!/bin/bash
# command, comment
cond_echo(){
	echo $2
	read -p "Run:'$1' [Y/n]"
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo $1 >> gen.sh

	fi
}
rm gen.sh
echo "set -x" > gen.sh
cond_echo "sudo apt update"
cond_echo "sudo apt upgrade"
	
read -p "XPS 13:'$1' [Y/n]"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#xps 13 specific
	cond_echo "dpkg -i dkms_2.2.0.3-2ubuntu3_all.deb" "xps 13 drivers"
	cond_echo "sudo cp BCM20702A1-0a5c-216f.hcd /lib/firmware/brcm/ && sudo chmod 0644 /lib/firmware/brcm/BCM20702A1-0a5c-216f.hcd" "xps 13 firmware"
fi

read -p "XPS 15:'$1' [Y/n]"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cond_echo "sudo cp BCM20702A1-0a5c-216f.hcd /lib/firmware/brcm/ && sudo chmod 0644 /lib/firmware/brcm/BCM20702A1-0a5c-216f.hcd" "xps 15 firmware"

fi

#install some useful programs
cond_echo "sudo apt install -y vim-gnome"
cond_echo "sudo apt install -y skype"
cond_echo "sudo apt install -y vlc"
cond_echo "sudo apt install -y xsel"
cond_echo "sudo apt install -y gparted"
cond_echo "sudo apt install -y ubuntu-restricted-extras"
cond_echo "sudo apt install -y git "
cond_echo "sudo apt install -y sshfs"
cond_echo "sudo apt install -y openssh-server"
cond_echo "sudo apt install -y mosh"
cond_echo "sudo apt install -y tlp"
cond_echo "sudo apt install -y gnome-tweak-tool"
cond_echo "sudo apt install -y gcc"
cond_echo "sudo apt install -y make"
cond_echo "sudo apt install -y zsh"
cond_echo "sudo apt install -y tmux"
cond_echo "snap install spotify"
#configure git email and name?
cond_echo "git config --global user.email 'JAH1809@gmail.com' && git config --global user.name joel"
#change default editor
cond_echo "update-alternatives --config editor"

cond_echo "mkdir $HOME/git/dotfiles"
cond_echo "mkdir $HOME/git/dotfiles && git clone http://github.com/joelhutton/dotfiles $HOME/git/dotfiles"
cond_echo "$HOME/dotfiles/setup.sh"
cond_echo "mkdir $HOME/git/scripts && git clone http://github.com/joelhutton/scripts $HOME/git/scripts"
cond_echo "gnome-tweak-tool" "open gnome tweak tool to swap caps and escape"
cond_echo "firefox https://www.privateinternetaccess.com/installer/x/download_installer_linux" "get pia vpn"
cond_echo "ssh-keygen" "generate ssh key?"

chmod +x gen.sh
