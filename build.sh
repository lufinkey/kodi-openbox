#!/bin/bash
if ! type "fakeroot" > /dev/null
then
	>&2 echo "You must install the package \"fakeroot\" in order to correctly build this DEB file"
	exit 1
fi
fakeroot dpkg -b kodi-openbox
