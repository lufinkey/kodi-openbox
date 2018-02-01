# kodi-openbox
An xsession that runs Kodi media center on top of an Openbox session

## Install

The following commands will build and install a .deb package, for use on Debian and Ubuntu systems:

```bash
./build.sh
sudo dpkg -i kodi-openbox.deb
```

If your system does not support deb package management, you can install the files manually with the following command in bash:

```bash
sudo cp -r -t / kodi-openbox/[!DEBIAN]*
```

## Usage

On most systems, you should be able to choose your X session at the login screen. Choose "Kodi Openbox" and log in to start the session.

### Commands

* **kodi-openbox-session** - runs a kodi-openbox session
* **kodi-openbox-runprogram** - closes kodi and runs a command. Kodi will reopen when the command completes. Arguments are the command to run
* **kodi-openbox-runprogram.real** - disowned process from kodi-openbox-runprogram. You should not run this manually

### Openbox background
To set the background color of your openbox session, add the following command to *~/.config/openbox/autostart.sh*
``` bash
xsetroot -solid '#000000'
```
This will set the openbox background color to black, but you can change the hex value to be any color.

### Launching external programs from kodi
There are various kodi addons for launching external programs, but the one I tend to use is [Advanced Launcher](http://kodi.wiki/view/Add-on:Advanced_Launcher). If you want kodi to close when launching an external program, use the **kodi-openbox-runprogram** command as your program, and the command you want to run as its arguments.

### Preventing display sleep in external programs
If your display keeps going to sleep outside of kodi, it may be caused by a number of different programs.

To prevent gnome desktop from putting your display to sleep, run the following commands in a terminal while logged in as your kodi user:
``` bash
# Prevent display from going to sleep
gsettings set org.gnome.desktop.session idle-delay 0
# Prevent session from locking if the display does go to sleep
gsettings set org.gnome.desktop.screensaver lock-enabled false
```
To prevent X11 from putting your display to sleep, add the following commands to *~/.config/openbox/autostart.sh*
``` bash
# Disable screen saver
xset s off
# Disable screen blanking
xset s noblank
# Disable "Display Power Management Signaling"
xset -dpms
```
