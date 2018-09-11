" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     11.09.2018
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal expandtab   " tex intendation works better with spaces

" add myitem etc. (itemize package) environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|myenum\|myitem\|alphenum\|tabbedenum\|checklist'

compiler latexmk

nnoremap <buffer> <silent> <F11> :w<cr>:wa<cr>:make<cr><cr><cr>:cw<cr>

" soft-wrap
set formatoptions=l
set columns=100
autocmd VimResized * if (&columns > 100) | set columns=100 | endif
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
