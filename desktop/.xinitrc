#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     05.01.2021
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

# set Wacom tablet to mode "Relative" (requires "xf86-input-wacom" package)
xsetwacom set "Wacom One by Wacom S Pen stylus" mode Relative

# start conky
conky &

# exec awesome WM
exec awesome
