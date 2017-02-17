" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     17.02.2017
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

" add task environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|tasks\|Tasks'
let g:tex_items = '\\bibitem\|\\item\|\\task' 

compiler latexmk
"compiler rubber

nnoremap <buffer> <silent> <F11> :wa<cr>:make<cr><cr>
