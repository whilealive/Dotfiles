" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     -
"
" DATE     22.03.2014
" OWNER    Bischofberger
" ==================================================================


" general settings
" ----------------
set ttyfast         "fast terminal connection
set nocompatible    "no vi-compatible modus
set autowrite       "automatically writes when switching buffers, :wnext not necessary
filetype plugin indent on
syntax enable

" writing and reading
" -------------------
set showmode        "shows, in which mode you are currently in
set showmatch       "shows the opening bracket when typing )}]
set showcmd         "for longer commands in command mode
set ruler           "shows row/column number of the cursor
set nojoinspaces    "insert only one space after .,?!
set cpo+=$          "shows the end of the text to be changed when pressing c
set whichwrap=""    "don't exceed the end of the line with the cursor
set hlsearch        "highlight searching results

" file and path managing
" ----------------------
" -> press ,cd for changing to current dir
" -> ...
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'  "hide dotfiles by default
let g:netrw_browse_split=3                    "open files in new tabs
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" tabs and indent
" ---------------
set autoindent      "automatically indent lines to previous lines
set shiftwidth=4    "autoindent indents 4 inits (= 1 tab)
set tabstop=4       "tabstop length
set expandtab       "fill up with spaces when pressing <tab>

" layout
" ------
colorscheme bruno-custom    "my personal color scheme
set cursorline              "cursorline, sometimes pretty slow...
set number                  "show line numbers

" quickly compile within vim, compilation with <F2>, execution with <F3>
" ----------------------------------------------------------------------
autocmd FileType c map <F2> :!gcc -o "%:p:r.out" "%:p" <bar> more<CR>
autocmd FileType c map <F3> :!"%:p:r.out"<CR>
autocmd FileType cpp map <F2> :!g++ -std=c++11 -o "%:p:r.out" "%:p" <bar> more<CR>
autocmd FileType cpp map <F3> :!"%:p:r.out"<CR>
autocmd FileType java map <F2> :!javac "%:p" <bar> more<CR>
autocmd FileType java map <F3> :!java -cp "%:p:h" "%:t:r"<CR>

" brackets as I like them... 
" --------------------------
" -> <S-F4> doesn't work
" -> ...
imap <F4> {<CR>}<Esc>O

" taglist plugin
" --------------
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>
