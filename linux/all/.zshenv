# ==================================================================
# FILE     .zshenv
# OS       linux
# MACHINE  all
# INFO     - 
#
# DATE     11.02.2018
# OWNER    Bischofberger
# ==================================================================

## setup environment
export EDITOR="/usr/bin/vim"
export VISUAL="$EDITOR"
export RANGER_LOAD_DEFAULT_RC=False	# do only check custom ranger rc files in ~/.config/ranger/
#export LC_ALL=
#export LC_COLLATE="C"
#export GPG_TTY=$(tty)
#export GPGKEY="B1BD4E40"
#export PERL_SIGNALS="unsafe"
#export FCEDIT="$EDITOR"
#export SUDO_EDITOR="$EDITOR"
#export JavaScriptCoreUseJIT="0"
#export QUOTING_STYLE="literal"
#export ASPROOT="$HOME/Build/.asp"
#export CHROOT="$HOME/Build/chroot"
#export SDCV_PAGER="/usr/bin/less"
#export SYSTEMD_PAGER="less -j4aR"
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export BROWSER="$HOME/Scripts/runbrowser"
#export PASSWORD_STORE_DIR="$HOME/Sync/pass/"
#export OYSTTYERDIR="$XDG_CONFIG_HOME/oysttyer"

# man page colours
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;30;03;36m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'

# setup default dirs
[[ $XDG_CACHE_HOME ]] || export XDG_CACHE_HOME="$HOME/.cache"
[[ $XDG_CONFIG_HOME ]] || export XDG_CONFIG_HOME="$HOME/.config"
[[ $XDG_DATA_HOME ]] || export XDG_DATA_HOME="$HOME/.local/share"

#### linux console colors (jwr dark) ###
#
#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0000000" #black
#    echo -en "\e]P85e5e5e" #darkgrey
#    echo -en "\e]P18a2f58" #darkred
#    echo -en "\e]P9cf4f88" #red
#    echo -en "\e]P2287373" #darkgreen
#    echo -en "\e]PA53a6a6" #green
#    echo -en "\e]P3914e89" #darkyellow
#    echo -en "\e]PBbf85cc" #yellow
#    echo -en "\e]P4395573" #darkblue
#    echo -en "\e]PC4779b3" #blue
#    echo -en "\e]P55e468c" #darkmagenta
#    echo -en "\e]PD7f62b3" #magenta
#    echo -en "\e]P62b7694" #darkcyan
#    echo -en "\e]PE47959e" #cyan
#    echo -en "\e]P7899ca1" #lightgrey
#    echo -en "\e]PFc0c0c0" #white
#    clear # bring us back to default input colours
#fi
