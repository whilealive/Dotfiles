" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file, no plugin needed
"
" DATE     19.08.2015
" OWNER    Bischofberger
" ==================================================================


setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions+=tlw
nnoremap ,af :setlocal formatoptions+=a<CR>
nnoremap ,mf :setlocal formatoptions-=a<CR>

"compile within vim using make and rubber
"if the current dir doesn't have a Makefile, it compiles using the generic
"Makefile given after exec...
setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
  exec "setlocal makeprg=make\\ -f\\ ~/Developer/make/latex.mk\\ " . substitute(bufname("%"),"tex","pdf", "")
endif

function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction
