#!/bin/bash
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(1 "Full installation" off    
         2 "Partial" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            echo "starting installation..."
echo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - #

sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

apt-get -y install texmaker

apt-get -y -f install

add-apt-repository ppa:webupd8team/popcorntime #

add-apt-repository ppa:ubuntu-wine/ppa #


apt-get update


apt-get --assume-yes install google-chrome-stable #

apt-get --assume-yes install popcorn-time #

apt-get --assume-yes install nautilus-dropbox #

apt-get --assume-yes install wine1.7 #



tar -xzf ~/Téléchargements/eclipse*.tar.gz -C /opt #

echo -e "[Desktop Entry]\nName=Eclipse\nType=Application\nExec=/opt/eclipse/eclipse\nTerminal=false\nIcon=/opt/eclipse/icon.xpm\nComment=Integrated Development Environment\nNoDisplay=false\nCategories=Development;IDE\nName[en]=eclipse.desktop"  >> /usr/share/applications/eclipse.desktop #

chmod a+r /usr/share/applications/eclipse.desktop #


apt-get --assume-yes update 
apt-get -y upgrade
            ;;
        2)
            cmda=(dialog --separate-output --checklist "Select options:" 22 76 16)
optionsa=(1 "Google Chrome" off    # any option can be set to default to "on"
         2 "Popcorn Time" off
         3 "Eclipse" off
         4 "Wine" off
	 5 "Dropbox" off
	 6 "TeXMaker" off
	 7 "Updates" off
	 8 "Quit" off)

choicesa=$("${cmda[@]}" "${optionsa[@]}" 2>&1 >/dev/tty)
clear
for choicea in $choicesa
do
case $choicea in
	1)
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	apt-get --assume-yes install google-chrome-stable
	
	;;
	
	2)
	add-apt-repository ppa:webupd8team/popcorntime
	apt-get update
	apt-get --assume-yes install popcorn-time 
	
	;;

	3)
	tar -xzf ~/Téléchargements/eclipse*.tar.gz -C /opt

	echo -e "[Desktop Entry]\nName=Eclipse\nType=Application\nExec=/opt/eclipse/eclipse\nTerminal=false\nIcon=/opt/eclipse/icon.xpm	\nComment=Integrated Development Environment\nNoDisplay=false\nCategories=Development;IDE\nName[en]=eclipse.desktop"  >> /usr/share/applications/eclipse.desktop

	chmod a+r /usr/share/applications/eclipse.desktop 
	
	;;

	4)
	add-apt-repository ppa:ubuntu-wine/ppa
	apt-get update
	apt-get --assume-yes install wine1.7
	
	;;

	5)
	apt-get --assume-yes install nautilus-dropbox
	
	;;

	6)
	apt-get -y install texmaker
	apt-get -y -f install
	
	;;

	7)
	apt-get --assume-yes update 
 	apt-get --assume-yes upgrade 

	;;

	8)
	echo
	echo "Installation terminated"
	break
	;;

esac
done
            ;;
    esac
done
