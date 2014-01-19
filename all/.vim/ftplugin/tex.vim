" ==================================================================
" FILE     .vim/ftplugin/java.vim
" MACHINE  all
" INFO     -
"
" DATE     18.01.2014
" OWNER    Bischofberger
" ==================================================================


" standard eclipse indentation
set shiftwidth=4
set tabstop=4
set noexpandtab

" ctags java tags, use Ctrl-] to jump around
set tags=./.tags

" auto-complete classes, methods, etc, use Ctrl-N
set complete=.,w,b,u,t,i

" folding
set foldmethod=indent
set foldlevel=1
