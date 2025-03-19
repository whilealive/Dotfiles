# ==================================================================
# FILE     .bash_profile
# MACHINE  all
# INFO     -
#
# DATE     18.01.2014
# OWNER    Bischofberger
# ==================================================================


[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X automatically
#vt=$(fgconsole 2>/dev/null)
#(( vt == 1 )) && exec startx -- vt$vt &> ~/.xlog
#unset vt

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
