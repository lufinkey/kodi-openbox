#!/bin/bash
if ! type "fakeroot" > /dev/null
then
	echo "You must install the package \"fakeroot\" in order to correctly build this DEB file"
	sudo apt-get install -y "fakeroot" || exit 1
fi
fakeroot dpkg -b kodi-openbox
