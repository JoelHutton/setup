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

#install some useful programs
cond_echo "sudo apt install -y vim-gnome"
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
cond_echo "sudo apt install -y xbindkeys"
cond_echo "sudo apt install -y wireguard"
cond_echo "sudo apt install -y slack"
cond_echo "snap install spotify"
#configure git email and name?
cond_echo "git config --global user.email 'JAH1809@gmail.com' && git config --global user.name joel"
#change default editor
cond_echo "update-alternatives --config editor"

cond_echo "mkdir $HOME/git/dotfiles"
cond_echo "mkdir $HOME/git/dotfiles && git clone ssh://git@github.com/joelhutton/dotfiles $HOME/git/dotfiles"
cond_echo "$HOME/dotfiles/setup.sh"
cond_echo "mkdir $HOME/git/scripts && git clone ssh://git@github.com/joelhutton/scripts $HOME/git/scripts"
cond_echo "gnome-tweak-tool" "open gnome tweak tool to swap caps and escape"
cond_echo "firefox https://www.privateinternetaccess.com/installer/x/download_installer_linux" "get pia vpn"
cond_echo "ssh-keygen" "generate ssh key?"
cond_echo "mkdir ~/wireguard && wg genkey | tee ~/wireguard/privatekey | wg pubkey > ~/wireguard/publickey" "generate wireguard keys?"

chmod +x gen.sh
