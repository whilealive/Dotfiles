#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     27.02.2016
# OWNER    Bischofberger
# ==================================================================


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set X11 keymap
setxkbmap -layout ch

# ---------------everything from here belongs to the dwm setup---------------------

# load terminus and custom fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# mute the stupid "Bing" sound
xset b off

# statusbar
dwmstatus &

# background image
sh ~/.fehbg &

# set NumLock
numlockx &

# start conky
conky &

# start gpg agent
eval $(gpg-agent --daemon)

# for geogebra
wmname LG3D

exec dwm
