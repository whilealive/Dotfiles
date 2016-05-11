" ==================================================================
" FILE     .vim/ftplugin/context.vim
" MACHINE  all
" INFO     Personal context.vim config file
"
" DATE     11.05.2016
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

compiler context
