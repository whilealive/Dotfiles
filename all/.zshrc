# ==================================================================
# FILE     .zshrc
# INFO     as usual: mostly stolen from Jason Ryan, bitbucket
#
# DATE     14.04.2021
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
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
bindkey -v
KEYTIMEOUT=1


# auto cd
setopt autocd extendedglob nomatch completealiases
setopt correct          # try to correct spelling
setopt no_correctall    # …only for commands, not filenames


# syntax highlighting (load package "zsh-syntax-highlighting")
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# history traveling
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-history
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-history


# tmux-helpers
source "$HOME/Scripts/f_tmuxHelpers"


# functions
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
alias sdm="udiskie-mount -a"
alias sdu="udiskie-umount --detach -a"
alias udiskied="udiskie --no-automount --no-file-manager --smart-tray &"


# various aliasses
alias susp="systemctl suspend"
alias ls="ls --color=auto"
export GREP_COLOR="1;31"
alias grep="grep --color=auto"
alias ra="ranger-cd"
alias llmk="latexmk -lualatex -interaction=nonstopmode -file-line-error"
alias swacom="xsetwacom set \"Wacom One by Wacom S Pen stylus\" mode Relative"
alias mwacom="xsetwacom set \"Wacom One by Wacom M Pen stylus\" mode Relative"
