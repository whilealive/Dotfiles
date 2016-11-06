" ==================================================================
" FILE     .vim/ftplugin/text.vim
" MACHINE  all
" INFO     
"
" DATE     11.10.2016
" OWNER    Bischofberger
" ==================================================================

"behave like a word processor
setlocal formatoptions=l  "see :help fo-table
"setlocal formatoptions=tcroqawl  "see :help fo-table
setlocal wrap
setlocal linebreak

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

