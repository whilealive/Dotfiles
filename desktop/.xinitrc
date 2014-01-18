#!/bin/sh
# ==================================================================
# FILE     .xinitrc
# MACHINE  desktop
# INFO     Executed by startx
#
# DATE     03.01.2014
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
while true; do Scripts/dwm-statusbar-desktop.sh ; sleep 5; done &

# background image
#sh ~/.fehbg &

# set NumLock
numlockx &

# start conky
#conky &

# clipboard management
xcmenu --daemon &

# start gpg agent
eval $(gpg-agent --daemon)

exec dwm




# ---------------------------------------------
# old stuff
# ----------------------------------------------

# take care of .Xresources (urxvt etc.)
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start urxvt daemon
#urxvtd -f &

# sync clipboard, uses quite a lot of cpu!!!
#/usr/bin/autocutsel -fork &
#/usr/bin/autocutsel -selection CLIPBOARD -fork &

