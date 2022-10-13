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
export AWT_TOOLKIT=MToolKit
export _JAVA_AWT_WM_NONREPARENTING=1
wmname LG3D

# Natural scrolling enable (the position of the setting moves...)
#POS=$(xinput --list-props "ETPS/2 Elantech Touchpad" | grep "Natural Scrolling Enabled (" | awk -F"[()]" '{print $2}')
#xinput set-prop "ETPS/2 Elantech Touchpad" $POS 1 &
xinput set-prop "VEN_06CB:00 06CB:CE7E Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "VEN_06CB:00 06CB:CE7E Touchpad" "libinput Natural Scrolling Enabled" 1 &
xinput set-prop "VEN_06CB:00 06CB:CE7E Touchpad" "libinput Middle Emulation Enabled" 1 &
xinput set-prop "VEN_06CB:00 06CB:CE7E Touchpad" "libinput Accel Speed" 0.4 &

light -N 1

# while true; do
    # dwm 2> ~/.dwm.log
# done

# exec dwm
exec awesome
