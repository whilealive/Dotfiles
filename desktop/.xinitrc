#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     27.02.2023
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

# mute the stupid "Bing" sound
xset b off

# load icc display profile
#xcalib -d :0 "$HOME/.color/icc/Displaycal_2023-02-27.icc"

# set NumLock
numlockx &

# udiskie automounter
udiskie -t &

# x-keys l-trac settings (see: ~/Scripts/ltrac)
ltrac

# start conky
conky &

# exec awesome WM
exec awesome
