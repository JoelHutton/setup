#!/bin/bash
#TODO adding --force-device-scale-factor=2 to all chromium-browser.desktop files

commands=()
#to make decisions about installing programs
prompt_install()
{
	echo "would you like to install $1 [y/n]"
	read cont
	if [ "$cont" == "y" ]
	then
		commands+=("apt-get -y install $1")
	else
		echo "bypassed"
	fi
}
prompt_exec()
{
	echo "would you like to $1 [y/n]"
	read cont
	if [ "$cont" == "y" ]
	then
		commands+=("$2")
	else
		echo "bypassed"
	fi
}
#at this stage you must get some form of internet connection or install dkms in order
#to install the proprietary drivers 
prompt_exec  'update programs' " apt-get update&& apt-get upgrade"
prompt_exec  'install propreitary drivers?'  "dpkg -i dkms_2.2.0.3-2ubuntu3_all.deb"
#install some useful programs
prompt_install vim-gnome
prompt_install skype
prompt_install vlc
prompt_install ubuntu-restricted-extras
prompt_install chromium-browser
prompt_install git 
prompt_exec  'go to chrome web page' "sudo -u joel chromium-browser https://www.google.com/chrome/browser/desktop/"
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
prompt_exec  'add spotiy repository key'  " apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59 D2C19886"
# 2. Add the Spotify repository
prompt_exec  'add spotify repository to sources' "echo deb http://repository.spotify.com stable non-free |  tee /etc/apt/sources.list.d/spotify.list"
prompt_exec  'install spotify' " apt update&& apt-get install spotify-client"
prompt_install git
promp_exec 'configure git email and name?' 'git config --global user.email "joel-hutton@hotmail.com" && git config --global user.name "Joel Hutton"'
prompt_install xclip 
prompt_install xsel 
prompt_install thunderbird
prompt_install thunderbird-gnome-support
prompt_exec 'get joels rc files from git?' 'cd /home/joel && git clone https://github.com/JoelHutton/vimrc.git && cd vimrc && ./setup.sh && cd .. && git clone https://github.com/JoelHutton/bashrc.git && cd bashrc && ./setup'
prompt_exec "force all chromium icons to rescale to 1.67 times (to act like a 1080p screen)" "find / -regex '.*\\.desktop' | sudo xargs sed -i 's:Exec=.*chromium-browser:\\0\\ --force-device-scale-factor=1.67:g'"

prompt_exec 'change default editor' 'sudo update-alternatives --config editor'
for command in "${commands[@]}"
do
	echo $command
done

echo 'remember to:
	add your ssh key to github
	enable natural scrolling'
