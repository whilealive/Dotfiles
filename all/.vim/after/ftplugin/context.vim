" ==================================================================
" FILE     .vim/ftplugin/context.vim
" MACHINE  all
" INFO     Personal context.vim config file
"
" DATE     05.02.2017
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal tw=90       " limited textwidth for readability
setlocal expandtab   " tex intendation works better with spaces

setlocal formatoptions=tcroqawl  " see :help fo-table

compiler context

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
