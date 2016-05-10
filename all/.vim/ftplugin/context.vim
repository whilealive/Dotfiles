" ==================================================================
" FILE     .vim/ftplugin/context.vim
" MACHINE  all
" INFO     Personal context.vim config file
"
" DATE     10.05.2016
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

" errorformat
setlocal efm=%El.%l%m
setlocal efm+=%+C\ %m
setlocal efm+=%+C[]%m
setlocal efm+=%+W%.%#at\ lines\ %l--%*\\d
setlocal efm+=%W%.%#at\ lines\ %m
setlocal efm+=%-G%.%#

"compile within vim using context command
"if the current dir doesn't have a Makefile, it compiles using the generic
"Makefile given after exec...
if filereadable('Makefile')
  setlocal makeprg=make
else
  exec "setlocal makeprg=make\\ -f\\ ~/Developer/make/context.mk\\ " . substitute(bufname("%"),"tex","pdf", "")
endif
