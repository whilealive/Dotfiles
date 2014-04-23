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

