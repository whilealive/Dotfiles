" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     27.12.2016
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

" add task environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|tasks\|Tasks'
let g:tex_items = '\\bibitem\|\\item\|\\task' 

compiler rubber

" open corresponding pdf
function! OpenPDF()
  let b:bufname = expand('%:r') . '.pdf'
  if filereadable(b:bufname)
    silent execute '!zathuratab ' . b:bufname
    redraw!
  else
    echoerr "File \"" . b:bufname . "\" does not exist."
  endif
endfunction

map <F4> :call OpenPDF()<cr><cr>
