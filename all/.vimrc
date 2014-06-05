" ==================================================================
" FILE     .vimrc
" MACHINE  all
" INFO     -
"
" DATE     05.06.2014
" OWNER    Bischofberger
" ==================================================================


" general settings
" ----------------
set ttyfast         "fast terminal connection
set nocompatible    "no vi-compatible modus
set autowrite       "automatically writes when switching buffers, :wnext not necessary
filetype plugin indent on
syntax enable
set mouse=a         "now works properly with st/tmux 

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
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
set wildchar=<Tab> wildmenu wildmode=full     "wildmenu activation (good for buffer switching)

" tabs and indent
" ---------------
set autoindent      "automatically indent lines to previous lines
set shiftwidth=4    "autoindent indents 4 inits (= 1 tab)
set tabstop=4       "tabstop length
set expandtab       "fill up with spaces when pressing <tab>
nnoremap <Tab> :tabnext<CR>

" layout
" ------
colorscheme bruno-custom    "my personal color scheme
set cursorline              "cursorline, sometimes pretty slow...
set number                  "show line numbers

" the <F-XX> keys...
" ------------------
"F2: brackets as I like them
imap <F2> {<CR>}<Esc>O
"F3: timestamp
nnoremap <F3> D"=strftime("DATE     %d.%m.%Y")<CR>p
"F4: run executable in shell
map <F4> :!"%:p:r"<CR>
"F5: create C++ tags
map <F5> :!ctags -R -I --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q --exclude="libraries" .<CR>

" configure tags
" --------------
"set tags+=~/.vim/tags/systags  "all C system headers

" OmniCppComplete
" ---------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
