#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     03.08.2021
# OWNER    Bischofberger
# ==================================================================

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# -----------everything from here belongs to the awesome setup-----------------

# set X11 keymap
setxkbmap -layout ch

# Logitech MX Ergo settings
# slow pointer / high acceleration
xinput set-prop "pointer:Logitech MX Ergo" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 4  # last entry is pointer speed (higher values lead to slower pointer)
xinput set-prop "pointer:Logitech MX Ergo" "libinput Accel Speed" 1                              # full acceleration speed
xinput set-prop "pointer:Logitech MX Ergo" "libinput Scroll Method Enabled" 0 0 1                # use track ball to scroll while pressing scroll wheel button

# mute the stupid "Bing" sound
xset b off

# set NumLock
numlockx &

# start conky
conky &

# exec awesome WM
exec awesome
