" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     -
"
" DATE     18.01.2014
" OWNER    Bischofberger
" ==================================================================


" general settings
set ttyfast				" fast terminal connection
set nocompatible		" no vi-compatible modus
set autowrite           " automatically writes when switching buffers, so :wnext is not necessary

" writing and reading
set showmode			" shows, in which mode you are currently in
set showmatch			" zeigt die öffnende Klammer beim Tippen von )}]
set showcmd		    	" für längere Befehle im Kommandomodus
set ruler		    	" zeigt Zeilen-/Spaltennummer des Cursors
set nojoinspaces		" fügt beim Verbinden von Zeilen nur ein Leerzeichen ein
set cpo+=$			    " zeigt bei c mit $ das Ende des zu ersetzenden Bereiches
set whichwrap=""		" man gelangt nicht mehr über das Zeilenende hinaus
set hlsearch			" hebt Suchresultat hervor

" tabs and indent
set autoindent			"automatischer Einzug
set tabstop=4			"tabstop hat n Einheiten Länge
set shiftwidth=4		"autoindent rückt n Einheiten ein
set noexpandtab			"füllt nicht mit Leerschlägen auf, wenn Tab gedrückt wird

" layout
colorscheme bruno-custom	"Farbeinstellung für Syntaxerkennung
set cursorline				"Linienhervorhebung der aktuellen Zeile, langsam!
set number		    		"zeigt Zeilennummern links

filetype plugin indent on
syntax enable

"compile within vim, compilation with <F2>, execution with <F3>
autocmd FileType c map <F2> :!gcc -o "%:p:r.out" "%:p" <bar> more<CR>
autocmd FileType c map <F3> :!"%:p:r.out"<CR>
autocmd FileType java map <F2> :!javac "%:p" <bar> more<CR>
autocmd FileType java map <F3> :!java -cp "%:p:h" "%:t:r"<CR>

"Geschweifte Klammern setzen
imap <F4> <Space>{<CR>}<Esc>%a<CR>
"imap <F4> <CR>{<CR>}<Esc>%a<CR>


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
