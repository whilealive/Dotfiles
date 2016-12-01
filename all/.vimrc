" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     minimalistic
"
" DATE     30.11.2016
" OWNER    Bischofberger
" ==================================================================

" ------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------
set ttyfast                 "fast terminal connection
set nocompatible            "no vi-compatible modus
set autowrite               "automatically writes when switching buffers, :wnext not necessary
filetype plugin indent on
syntax enable
set ttymouse=xterm          "vim doesn't know st
set mouse=a                 "now works properly with st/tmux 
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" writing and reading
" ------------------------------------------------------------------
set showmatch               "shows the opening bracket when typing )}]
set showcmd                 "for longer commands in command mode
set ruler                   "shows row/column number of the cursor
set nojoinspaces            "insert only one space after .,?!
set cpo+=$                  "shows the end of the text to be changed when pressing c
set whichwrap=<,>,[,]       "exceed the end of the line with cursor keys only
set hlsearch                "highlight searching results
set scrolloff=5							"keep some lines before and after cursor
set scrolljump=5            "lines to scroll when cursor leaves screen
set display=lastline        "show as much as possible of a wrapped last line, not just "@"
set hidden                  "keep history when switching buffers
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" spell checking
" ------------------------------------------------------------------
set complete+=kspell		    "auto completition with Ctrl-N, Ctrl-P
set spellfile=~/.vim/spell/bischofberger.utf-8.add
nnoremap ,sp :setlocal spell! spelllang=hun-de-CH-frami<CR>
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" file and path managing
" ------------------------------------------------------------------
"wildmenu activation (good for buffer switching)
set wildchar=<Tab> wildmenu wildmode=full

"go to current directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

"super fast buffer switching:
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" tabs and indent
" ------------------------------------------------------------------
set autoindent      "automatically indent lines to previous lines
set shiftwidth=2    "autoindent indents 2 inits (= 1 tab)
set expandtab       "fill up with spaces
set tabstop=2       "tabstop length
set softtabstop=2   "softtabstop length
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" layout
" ------------------------------------------------------------------
colorscheme bruno-custom         "my personal color scheme
set cursorline                   "cursorline, sometimes pretty slow...
set number                       "show line numbers
if &diff | syntax off | endif	   "disable syntax highlighting in vimdiff...
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" various mappings
" ------------------------------------------------------------------
"put date at current position
nnoremap <F1> :set paste<CR>v5e"=strftime("%d.%m.%Y")<CR>p:set nopaste<CR>

" copy to CLIPBOARD, paste from CLIPBOARD and indent
map <F2> "+y
map <F3> "+p=}

"recreate tags file in current folder
nnoremap ,t :! ctags -R<CR>

" toggle auto formatting
nnoremap ,af :setlocal formatoptions+=a<CR>
nnoremap ,mf :setlocal formatoptions-=a<CR>

" delete both enclosing parantheses
nnoremap ,dp %x``x
"
" make
nnoremap <F11> :w<CR>:mak<CR><CR>

" show next error
nnoremap <F12> :cn<CR>

" space bar un-highlights search
noremap <silent> <Space> :silent noh<Bar>echo<CR>
" ------------------------------------------------------------------
