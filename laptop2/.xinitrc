#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  laptop2
# INFO     Executed by startx
#
# DATE     21.12.2017
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

# ---------------everything from here belongs to the dwm setup---------------------

# mute the stupid "Bing" sound
xset b off

# statusbar in C
#dwmstatus &

# keys
xbindkeys

# nm-applet
nm-applet --sm-disable &

# battery state
cbatticon --update-interval 30 &

# for geogebra
#wmname LG3D

#exec dwm
exec awesome
