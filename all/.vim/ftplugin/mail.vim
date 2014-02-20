" ==================================================================
" FILE     .vim/ftplugin/mail.vim
" MACHINE  all
" INFO     - mutt mail editing preferences, needs filetype.vim
"
" DATE     20.02.2014
" OWNER    Bischofberger
" ==================================================================

set tw=72  " limited textwidth for readability

"behave like a word processor
set formatoptions+=tlw
autocmd InsertEnter * set formatoptions+=a
autocmd InsertLeave * set formatoptions-=a
noremap Q :set fo-=w<Cr>gqap<Esc>:set fo+=w<CR>
