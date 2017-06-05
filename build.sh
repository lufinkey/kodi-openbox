#!/bin/bash
if ! type "fakeroot" > /dev/null
then
	echo "You must install the package \"fakeroot\" in order to correctly build this DEB file"
	if type "apt-get"
	then
		sudo apt-get install -y "fakeroot" || exit 1
	elif type "apt"
	then
		sudo apt install -y "fakeroot" || exit 1
	elif type "yum"
	then
		sudo yum install -y "fakeroot" || exit 1
	else
		>&2 echo "I don't know which package manager you have so you'll have to install it yourself"
		exit 1
	fi
fi
fakeroot dpkg -b kodi-openbox
