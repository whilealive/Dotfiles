" ==================================================================
" FILE     .vim/after/ftplugin/mail.vim
" MACHINE  all
" INFO     has to be put in after/ directory to overrule default ftplugin
"
" DATE     08.05.2017
" OWNER    Bischofberger
" ==================================================================

" soft-wrap
set formatoptions=l
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
