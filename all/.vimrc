" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     -
"
" DATE     04.06.2014
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
set tags=./tags;    "search for tags file in current dir

" file and path managing
" ----------------------
" -> press ,cd for changing to current dir
" -> ...
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
set wildchar=<Tab> wildmenu wildmode=full     "wildmenu activation (good for buffer switching)

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

" the <F-XX> keys...
" ------------------
"brackets as I like them
imap <F2> {<CR>}<Esc>O
"timestamp
:nnoremap <F3> D"=strftime("DATE     %d.%m.%Y")<CR>p
"run executable in shell
map <F4> :!"%:p:r"<CR>

