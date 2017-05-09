" ==================================================================
" FILE     .vim/ftplugin/text.vim
" MACHINE  all
" INFO     
"
" DATE     11.10.2016
" OWNER    Bischofberger
" ==================================================================

" soft-wrap
set formatoptions=l
set columns=100
autocmd VimResized * if (&columns > 100) | set columns=100 | endif
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
