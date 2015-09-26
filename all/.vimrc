" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     minimalistic
"
" DATE     26.09.2015
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

" -------------------
" spell checking
" -------------------
"nnoremap <F2> :setlocal spell! spelllang=de_ch,en<CR>
nnoremap ,sp :setlocal spell! spelllang=de_ch,en<CR>
set complete+=kspell		    "auto completition with Ctrl-N, Ctrl-P

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
set tabstop=2       "tabstop length
set softtabstop=2   "softtabstop length
set noexpandtab     "do not fill up with spaces, use TAB

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
nnoremap ,d D"=strftime("%d.%m.%Y")<CR>p
"recreate tags file in current folder
nnoremap ,t :! ctags -R<CR>

" -------------------------------
" use dmenu to open files quickly
" -------------------------------
"Strip the newline from the end of a string
function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction
"Find a file and pass it to cmd
function! DmenuOpen(cmd)
	let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
	"let fname = Chomp(system("find . | dmenu -i -l 20 -p " . a:cmd))
	if empty(fname)
		return
	endif
	execute a:cmd . " " . fname
endfunction
" Mappings
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

nnoremap ,pt :set invpaste paste?<CR>
set pastetoggle=,pt
