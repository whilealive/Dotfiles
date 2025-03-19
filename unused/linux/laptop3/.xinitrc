#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  laptop3
# INFO     Executed by startx
#
# DATE     26.01.2023
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

# NetworkManager applet
nm-applet &

# battery state
cbatticon --update-interval 30 &

# logitech mx ergo trackwheel settings
mxergo &

# exec awesome WM
exec awesome
