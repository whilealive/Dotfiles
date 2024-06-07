" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     minimalistic
"          <F1> :  (.vimrc)       save file
"          <F2> :  (.vimrc)       copy to CLIPBOARD
"          <F3> :  (.vimrc)       paste from CLIPBOARD
"          <F4> :  (.vimrc)       update file header
"          ,<F4> : (tex.vim)      update norm in tex files
"          <F5> :  (tex.vim)      compile .tex-file
"          <F6> :  (openPDF.vim)  open *filename*.pdf
"          <F7> : 
"          <F8> : 
"          <F9> : 
"          <F10> : 
"          <F11> : 
"          <F12> : 
"
" DATE     04.06.2024
" OWNER    Bischofberger
" ==================================================================

" ------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------
set ttyfast                 "fast terminal connection
set nocompatible            "no vi-compatible modus
set autowrite               "automatically writes when switching buffers, :wnext not necessary
set autoread                "automatically re-read file if modified outside of vim
filetype plugin indent on
syntax enable
set mouse=a                 "now works properly with st/tmux 
"set ttymouse=xterm          "vim doesn't know st
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" foot terminal
" ------------------------------------------------------------------
set termguicolors
let &t_8f = "\<Esc>[38:2::%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2::%lu:%lu:%lum"

set ttymouse=sgr

" Workaround bug in vim, where it incorrectly thinks modifyOtherKeys level 2 is
" enabled, even when it's not. The snippets below ensure modifyOtherKeys=2 is
" enabled. https://github.com/vim/vim/issues/9014
"let &t_TI = "\<Esc>[>4;2m"
"let &t_TE = "\<Esc>[>4;m"
"set timeoutlen=3000
"set ttimeoutlen=100
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" writing and reading
" ------------------------------------------------------------------
set showmatch               "shows the opening bracket when typing )}]
set showcmd                 "for longer commands in command mode
set ruler                   "shows row/column number of the cursor
set rulerformat=%22(char:\ %v\ line:\ %l%)
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

" Search down into subfolders
set path+=**

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
set wrap                         "wrap long lines visually (soft-wrap)
set nolist                       "make sure wrap option won't be disabled
set linebreak                    "wrap between words only
set breakindent                  "keep indentation when soft-wrapping
set showbreak=↪\ 
"set showbreak=>\ 
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" netrw settings
" ------------------------------------------------------------------
let g:netrw_banner         = 0
let g:netrw_keepdir        = 0
let g:netrw_liststyle      = 2
let g:netrw_retmap         = 1
let g:netrw_special_syntax = 1
" ------------------------------------------------------------------


" ------------------------------------------------------------------
" various mappings
" ------------------------------------------------------------------
" save shortcut
imap <F1> <ESC>:w<CR>a
nnoremap <F1> :w<CR>

"copy/paste to/from CLIPBOARD
"Wayland
vnoremap <F2> y:call system("wl-copy", @")<CR>
nnoremap <F3> :let @+=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>:set paste<CR>"+p:set nopaste<CR>
vnoremap <F3> <ESC>:let @+=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>:set paste<CR>gv"+p:set nopaste<CR>

"X11
"vnoremap <F2> "+y
"nnoremap <F3> :set paste<CR>"+p:set nopaste<CR>
"vnoremap <F3> <ESC>:set paste<CR>gv"+p:set nopaste<CR>


"update filename and date in file header
nnoremap <F4> magg
      \/FILE<CR>
      \W:set paste<CR>v$h"%p:set nopaste<CR>
      \/DATE<CR>
      \W:set paste<CR>v5e"=strftime("%d.%m.%Y")<CR>p:set nopaste<CR>
      \'a
      \:nohlsearch<CR>

"recreate tags file in current folder
nnoremap ,t :! ctags -R<CR>

"toggle auto formatting
nnoremap ,af :setlocal formatoptions+=a<CR>
nnoremap ,mf :setlocal formatoptions-=a<CR>

"delete both enclosing parantheses
nnoremap ,dp{ di{v%p
nnoremap ,dp( di(v%p
nnoremap ,dp[ di[v%p

"space bar un-highlights search
noremap <silent> <Space> :set hlsearch!<CR>

" :HardcopyPdf
" print to a pdf (see: https://askubuntu.com/questions/705973/how-can-i-print-from-vim-to-pdf)
set printfont=Courier:h8
command! -range=% HardcopyPdf <line1>,<line2> hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo 'Created: %.pdf'

" ------------------------------------------------------------------


" ------------------------------------------------------------------
" vimwiki settings
" ------------------------------------------------------------------
" use markdown as default syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_global_ext = 0
"let g:vimwiki_list_margin = 0
"let g:vimwiki_listsyms = ' %✓'
