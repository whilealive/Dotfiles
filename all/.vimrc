" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     -
"
" DATE     21.01.2014
" OWNER    Bischofberger
" ==================================================================


" general settings
set ttyfast				"fast terminal connection
set nocompatible		"no vi-compatible modus
set autowrite           "automatically writes when switching buffers, so :wnext is not necessary
filetype plugin indent on
syntax enable

" writing and reading
set showmode			"shows, in which mode you are currently in
set showmatch			"shows the opening bracket when typing )}]
set showcmd		    	"for longer commands in command mode
set ruler		    	"shows row/column number of the cursor
set nojoinspaces		"insert only one space after .,?!
set cpo+=$			    "shows the end of the text to be changed when pressing c
set whichwrap=""		"don't exceed the end of the line with the cursor
set hlsearch			"highlight searching results

" tabs and indent
set autoindent			"automatically indent lines to previous lines
set shiftwidth=4		"autoindent indents 4 inits (= 1 tab)
set tabstop=4			"tabstop length
set noexpandtab			"don't fill up with spaces when pressing <tab>

" layout
colorscheme bruno-custom	"my personal color scheme
set cursorline				"cursorline, sometimes pretty slow...
set number		    		"show line numbers

" compile within vim, compilation with <F2>, execution with <F3>
autocmd FileType c map <F2> :!gcc -o "%:p:r.out" "%:p" <bar> more<CR>
autocmd FileType c map <F3> :!"%:p:r.out"<CR>
autocmd FileType java map <F2> :!javac "%:p" <bar> more<CR>
autocmd FileType java map <F3> :!java -cp "%:p:h" "%:t:r"<CR>

" brackets as I like them...
imap <F4> <Space>{<CR>}<Esc>%a<CR>


"===================================================================================
"Plugins
"===================================================================================

"--------------------------
"Options for vim-latexsuite
"--------------------------
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"--------------------
" Options for NERDTree
"--------------------
" start NERDTree if vim is open with no files are open
"autocmd vimenter * if !argc() | NERDTree | endif  
" toggle NERDTree with <F5>
"map <F5> :NERDTreeToggle<CR>
" close vim if the only buffer left open is NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"-------------------
" Options for taglist
"-------------------
" toggle taglist with <F6>
"nnoremap <silent> <F6> :TlistToggle<CR>
