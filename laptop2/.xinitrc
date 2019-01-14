#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  laptop2
# INFO     Executed by startx
#
# DATE     14.01.2019
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

# wicd (networking)
wicd-client --tray &

# battery state
cbatticon --update-interval 30 &

# exec awesome WM
exec awesome
