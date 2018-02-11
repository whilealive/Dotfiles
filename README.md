# Dotfiles
configuration files for my linux machines (desktop/laptop)


## current setup

#### linux distro
- Arch Linux

#### window manager
- awesome wm

#### terminal
- st
- zsh
- tmux

#### editor
- vim

#### file manager
- ranger

#### image viewer
- sxiv

#### email
- mutt
- mbsync

#### contacts/calendar
- vdirsyncer
- khard
- khal

#### pdf viewer
- zathura

#### latex
- lualatex
- latexmk
- vim
- zathura

####  miscellaneous
- conky
- git
- gnupg


## handling

- dotfiles in folder "all/" represent machine-independent
  preferences.
- other dotfiles contain machine-dependent stuff.
- I manage my dotfiles through an extra folder "~/Dotfiles/" 
  which contains the original files. All dotfiles are
  symlinked to this folder. Makes it possible to handle 
  machine-independent files.

