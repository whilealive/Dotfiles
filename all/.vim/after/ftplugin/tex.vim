" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     27.04.2017
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

" add myitem etc. (itemize package) environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|myenum\|myitem\|alphenum\|tabbedenum'

compiler latexmk

nnoremap <buffer> <silent> <F11> :w<cr>:wa<cr>:make<cr><cr>
