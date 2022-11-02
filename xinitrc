#!/bin/sh

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

# blueman-applet &
# nm-applet &
# picom -D 3 &
# nitrogen --restore &
# pacman-chron &
# dwm-iconbar &
# #dropbox start &
# dunst &
# xautolock -time 30 -locker pixellock &
# setxkbmap -layout "us,se(nodeadkeys)" -option grp:caps_toggle &
# clipclean &

# Fix java programs
# export AWT_TOOLKIT=MToolKit
# export _JAVA_AWT_WM_NONREPARENTING=1
# wmname LG3D

