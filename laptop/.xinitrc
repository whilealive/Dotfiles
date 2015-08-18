#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  laptop
# INFO     Executed by startx
#
# DATE     18.08.2015
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

# load terminus and custom fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# mute the stupid "Bing" sound
xset b off

# statusbar in C
dwmstatus &

# background image
sh ~/.fehbg &

# keys
numlockx
xbindkeys

# start gpg agent
eval $(gpg-agent --daemon)

exec dwm
