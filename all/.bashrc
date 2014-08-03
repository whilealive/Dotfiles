# ==================================================================
# FILE     .bashrc
# MACHINE  all
# INFO     -
#
# DATE     20.06.2014
# OWNER    Bischofberger
# ==================================================================


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set environment variables
export VISUAL=vim
export EDITOR=vim
export RANGER_LOAD_DEFAULT_RC=False	# do only check custom ranger rc files in ~/.config/ranger/

# Prompt style
set_prompt_style () {
        PS1="┌─[\[\e[31m\]\h\[\e[0m\] \[\e[32m\]\w\[\e[0m\]]\n└─╼ "
}
set_prompt_style

# bash options
set -o vi                   # Vi mode
shopt -s autocd             # change to named directory
shopt -s dotglob            # include dotfiles in pathname expansion

# color coreutils
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# various aliasses
#alias startx='startx &> ~/.xlog'
alias feh="feh --action7 'mv %F ~/.trash/' -d -S filename --keep-zoom-vp"

# color manpages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Shortkeys, Aliases
#alias susp="systemctl suspend"

# Extract Files
extract() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "\`$1': unrecognized file compression" ;;
      esac
  else
      echo "\`$1' is not a valid file"
  fi
}

# udisks_functions to automount devices
# (from the AUR)
. /etc/udisks_functions/udisks_functions
