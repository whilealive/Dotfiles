" ==================================================================
" FILE     .vim/ftplugin/mail.vim
" MACHINE  all
" INFO     
"
" DATE     05.09.2014
" OWNER    Bischofberger
" ==================================================================

setlocal tw=72  " limited textwidth for readability

"behave like a word processor
setlocal formatoptions+=atlw
noremap Q :set fo-=w<Cr>gqap<Esc>:set fo+=w<CR>
