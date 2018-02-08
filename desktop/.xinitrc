#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     08.02.2018
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

# -----------everything from here belongs to the awesome setup-----------------

# mute the stupid "Bing" sound
xset b off

# set NumLock
numlockx &

# start conky
conky &

# exec awesome WM
exec awesome
