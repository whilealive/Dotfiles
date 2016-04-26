" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     minimalistic
"
" DATE     26.04.2016
" OWNER    Bischofberger
" ==================================================================

" ----------------
" general settings
" ----------------
set ttyfast                 "fast terminal connection
set nocompatible            "no vi-compatible modus
set autowrite               "automatically writes when switching buffers, :wnext not necessary
filetype plugin indent on
syntax enable
set ttymouse=xterm          "vim doesn't know st
set mouse=a                 "now works properly with st/tmux 

" -------------------
" writing and reading
" -------------------
set showmode                "shows, in which mode you are currently in
set showmatch               "shows the opening bracket when typing )}]
set showcmd                 "for longer commands in command mode
set ruler                   "shows row/column number of the cursor
set nojoinspaces            "insert only one space after .,?!
set cpo+=$                  "shows the end of the text to be changed when pressing c
set whichwrap=""            "don't exceed the end of the line with the cursor
set hlsearch                "highlight searching results
set scrolloff=5							"keep some lines before and after cursor

" -------------------
" spell checking
" -------------------
nnoremap ,sp :setlocal spell! spelllang=hun-de-CH-frami<CR>
set complete+=kspell		    "auto completition with Ctrl-N, Ctrl-P
set spellfile=~/.vim/spell/bischofberger.utf-8.add

" ----------------------
" file and path managing
" ----------------------
"go to current directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"wildmenu activation (good for buffer switching)
set wildchar=<Tab> wildmenu wildmode=full
"Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null
"super fast buffer switching:
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" ---------------
" tabs and indent
" ---------------
set autoindent      "automatically indent lines to previous lines
set shiftwidth=2    "autoindent indents 2 inits (= 1 tab)
set expandtab       "fill up with spaces
set tabstop=2       "tabstop length
set softtabstop=2   "softtabstop length

" ------
" layout
" ------
colorscheme bruno-custom         "my personal color scheme
set cursorline                   "cursorline, sometimes pretty slow...
set number                       "show line numbers
if &diff | syntax off | endif	   "disable syntax highlighting in vimdiff...

" ----------------
" various mappings
" ----------------
"put date at current position
nnoremap <F2> :set paste<CR>D"=strftime("%d.%m.%Y")<CR>p:set nopaste<CR>
"paste from paste buffer and indent
nnoremap <F3> "+p=}
" show all trailing spaces at end of line
nnoremap <F4> /\s\+$<Cr>
" toggle hlsearch
nnoremap <F5> :set hlsearch!<CR>
"recreate tags file in current folder
nnoremap ,t :! ctags -R<CR>
" toggle auto formatting
nnoremap ,af :setlocal formatoptions+=a<CR>
nnoremap ,mf :setlocal formatoptions-=a<CR>

