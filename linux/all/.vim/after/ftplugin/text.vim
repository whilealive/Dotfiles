" ==================================================================
" FILE     text.vim
" OS       all
" MACHINE  all
" INFO     
"
" DATE     26.07.2023
" OWNER    Bischofberger
" ==================================================================

" soft-wrap
"set formatoptions=l
"set columns=100
"autocmd VimResized * if (&columns > 100) | set columns=100 | endif
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
