" ==================================================================
" FILE     .vim/ftplugin/java.vim
" MACHINE  all
" INFO     -
"
" DATE     05.09.2014
" OWNER    Bischofberger
" ==================================================================


" standard eclipse indentation
setlocal shiftwidth=4
setlocal tabstop=4
setlocal noexpandtab

" ctags java tags, use Ctrl-] to jump around
setlocal tags=./.tags

" auto-complete classes, methods, etc, use Ctrl-N
setlocal complete=.,w,b,u,t,i

" folding
"setlocal foldmethod=indent
"setlocal foldlevel=1
