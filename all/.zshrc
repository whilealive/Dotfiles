# ==================================================================
# FILE     .zshrc
# INFO     as usual: mostly stolen from Jason Ryan, bitbucket
#
# DATE     12.02.2018
# OWNER    Bischofberger
# ==================================================================

autoload -U colors && colors

# prompts
LPROMPT () {
PS1="┌─[%{$fg[red]%}%m%{$fg[green]%} %~%{$fg_no_bold[yellow]%}%(0?.. %?)%{$reset_color%}]
└─╼ "
}

# Show vi mode
function zle-line-init zle-keymap-select {
    RPS1="%{$fg[yellow]%}${${KEYMAP/vicmd/%B Command Mode %b}/(main|viins)/ }%{$reset_color%}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

LPROMPT
PROMPT_EOL_MARK=" •"


# completitions
zstyle :compinstall filename '/$HOME/.zshrc'
autoload -Uz compinit
compinit


# history
HISTFILE="$HOME/.zshhistfile"
HISTSIZE=10000
SAVEHIST=$((HISTSIZE/2))
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
bindkey -v
KEYTIMEOUT=1


# auto cd
setopt autocd extendedglob nomatch completealiases
setopt correct          # try to correct spelling
setopt no_correctall    # …only for commands, not filenames


# syntax highlighting (load package "zsh-syntax-highlighting")
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search


# tmux-helpers
source "$HOME/Scripts/tmuxHelpers"

# functions
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

ranger-cd() {
	tempfile="$(mktemp -t tmp.XXXXXX)"
	/usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
			cd -- "$(cat "$tempfile")"
		fi
	rm -f -- "$tempfile"
}


# mount media (using udiskie)
alias sdbm="udiskie-mount /dev/sdb"
alias sdbu="udiskie-umount --detach /dev/sdb"
alias udiskied="udiskie --no-automount --no-file-manager --smart-tray --use-udisks2 &"


# various aliasses
alias susp="systemctl suspend"
alias ls="ls --color=auto"
export GREP_COLOR="1;31"
alias grep="grep --color=auto"
alias ra="ranger-cd"
alias llmk="latexmk -lualatex -interaction=nonstopmode -file-line-error"
alias volumiosync="rsync -avu --delete --exclude=to-be-converted --exclude=ogg Music/ --rsh=ssh volumio@192.168.178.29:/mnt/USB/Music/"
alias hdsleep="sudo hd-idle -a sdb -i 120"


## completions
## add custom completion scripts
#fpath=(~/.zsh/completion $fpath) 
#autoload -Uz compinit
#compinit
#
#zstyle ':completion:*' completer _complete _correct _approximate
#zstyle ':completion:*' expand prefix suffix
#zstyle ':completion:*' completer _expand_alias _complete _approximate
#zstyle ':completion:*' menu select
#zstyle ':completion:*' file-sort name
#zstyle ':completion:*' ignore-parents pwd
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*:pacman:*' force-list always
#zstyle ':completion:*:*:pacman:*' menu yes select
#zstyle -e ':completion:*' hosts 'reply=(cent pi sent veles)'
#zstyle :compinstall filename '$HOME/.zsh/zshrc'


## edit history
#autoload edit-command-line
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
#



#
## fix for cursor position
#autoload -U history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#
## prevent protected characters
#zle -A kill-whole-line vi-kill-line
#zle -A backward-kill-word vi-backward-kill-word
#zle -A backward-delete-char vi-backward-delete-char
#
#bindkey "^R" history-incremental-search-backward
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end
#bindkey "\e." insert-last-word
#bindkey "\eq" quote-line
#bindkey "\ek" backward-kill-line
#
## use the vi navigation keys in menu completion
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#
## manual pages for current command
#bindkey "^[h" run-help
#
## quoting URLs
#autoload -U url-quote-magic
#zstyle ':urlglobber' url-other-schema ftp git http https magnet
#zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='
#zle -N self-insert url-quote-magic
#
#
######### Aliases ########
#
##The 'ls' family
##---------------------------
#alias ll="ls -l --group-directories-first"
#alias ls="ls -h --color"    # add colors for filetype recognition
#alias la="ls -A"            # show hidden files
#alias lx="ls -xb"           # sort by extension
#alias lk="ls -lSr"          # sort by size, biggest last
#alias lc="ls -ltcr"         # sort by and show change time, most recent last
#alias lu="ls -ltur"         # sort by and show access time, most recent last
#alias lt="ls -ltr"          # sort by date, most recent last
#alias lm="ls -Al |more"     # pipe through 'more'
#alias lr="ls -lR"           # recursive ls
#alias lsr="tree -Csu"       # nice alternative to 'recursive ls'
#
## General ------------------
#alias rss="newsbeuter"
#alias sraw="sr archwiki"
#alias blog="cd ~/VCS/octopress"
#alias tmux="tmux -f ~/.tmux/conf"
#alias dush="du -sm *|sort -n|tail"
#alias fire="sudo ufw status verbose"
#alias pong="ping -c 3 www.google.com"
#alias makeup="updpkgsums && makepkg -ci"
#alias socks="ssh -D 8080 -f -C -q -N 200"
#alias nocomment='egrep -v "^[ \t]*#|^[ \t]*$"'
#alias irc="rm -f $HOME/.irssi/saved_colors && irssi"
#alias ttytter="Scripts/ttytter.pl -keyf=$TTYTTERDIR/key -rc=$TTYTTERDIR/jwr"
#alias oyster="Scripts/oysttyer.pl -keyf=$OYSTTYERDIR/oysttyerkey -rc=$OYSTTYERDIR/oysttyerrc"
#
######### Pacman ########
## update 
#alias pacup="sudo pacman -Syu"
#
## Remove orphans
#alias orphans="pacman -Qtdq"
#
#### Mounts ###
#alias centurion="sudo mount.nfs 192.168.1.100:/home/jason /media/Centurion"
#alias sentinel="sudo mount.nfs 192.168.1.200:/home/jason/Backups /media/Sentinel"
#
## to run bash functions
#autoload bashcompinit
#bashcompinit
#
#
## source highlighting
#source "$ZDOTDIR"/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#
## functions
#if [[ -d "$ZDOTDIR" ]]; then
#  for file in "$ZDOTDIR"/*.zsh; do
#    source "$file"
#  done
#fi
#
## terminfo
#if [[ -d $HOME/.terminfo ]]; then
#    export TERMINFO=$HOME/.terminfo
#fi
