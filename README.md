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

#### text editor
- vim

#### file manager
- ranger

#### image viewer
- sxiv
- geeqie

#### pdf viewer
- zathura

#### latex
- lualatex
- latexmk
- vim
- zathura

####  miscellaneous
- Logitech MX Ergo Trackball (see desktop/.xinitrc)
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

