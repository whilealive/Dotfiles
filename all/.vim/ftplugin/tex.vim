" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file, no plugin needed
"
" DATE     01.06.2015
" OWNER    Bischofberger
" ==================================================================


setlocal sw=2   " little indentation
"setlocal nocul  " disable cursorline, too slow
setlocal tw=90  " limited textwidth for readability

"behave like a word processor
setlocal formatoptions+=atlw
"autocmd InsertEnter * set formatoptions+=a
"autocmd InsertLeave * set formatoptions-=a
noremap Q :set fo-=w<Cr>gqap<Esc>:set fo+=w<CR>

"compile within vim using make and rubber
"if the current dir doesn't have a Makefile, it compiles using the generic
"Makefile given after exec...
setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
    setlocal makeprg=make
else
    exec "setlocal makeprg=make\\ -f\\ ~/Developer/make/latex.mk\\ " . substitute(bufname("%"),"tex","pdf", "")
endif
