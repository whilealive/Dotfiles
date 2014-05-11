" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file, no plugin needed
"
" DATE     23.04.2014
" OWNER    Bischofberger
" ==================================================================


set sw=2   " little indentation
set nocul  " disable cursorline, too slow
set tw=90  " limited textwidth for readability

"behave like a word processor
set formatoptions+=atlw
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
