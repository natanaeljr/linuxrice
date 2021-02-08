#!/bin/sh

##############################################################
# DEFAULT SECTION
##############################################################
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##############################################################
# CUSTOM SECTION
##############################################################
# keyboard layout
setxkbmap us altgr-intl
# speed up key repeat rate
xset r rate 220 38 &
# enable touchpad functions
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Middle Emulation Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Button Mapping Enabled" 1 0
# system tray
nm-applet &
volumeicon &
redshift-qt &
xfce4-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
# background
[ -x "$HOME/.fehbg" ] && "$HOME/.fehbg"

##############################################################
# Window Manager
##############################################################
if [[ -f "${HOME}/.dwmrc" ]]; then
    source "${HOME}/.dwmrc"
fi
exec /usr/local/bin/dwm
