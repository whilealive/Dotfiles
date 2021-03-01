#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  laptop2
# INFO     Executed by startx
#
# DATE     13.01.2021
# OWNER    Bischofberger
# ==================================================================

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set x11 keymap
setxkbmap -layout ch

# -----------everything from here belongs to the awesome setup-----------------

# mute the stupid "Bing" sound
xset b off

# set NumLock
numlockx &

# set Wacom tablet to mode "Relative" (requires "xf86-input-wacom" package)
xsetwacom set "Wacom One by Wacom S Pen stylus" mode Relative
xsetwacom set "Wacom One by Wacom M Pen stylus" mode Relative

# NetworkManager applet
nm-applet &

# battery state
cbatticon --update-interval 30 &

# exec awesome WM
exec awesome
