" ==================================================================
" File     openPDF.vim
" MACHINE  all
" INFO     plugin: open corresponding pdf (e.g. to .tex files)
"
" DATE     11.07.2019
" OWNER    Bischofberger
" ==================================================================

" Function: OpenPDF() {{{
" Description: Open 'bufname.pdf' if existing
function! OpenPDF()
  let b:bufname = expand('%:r') . '.pdf'
  if filereadable(b:bufname)
    silent execute '!zathura ' . b:bufname . '&'
    redraw!
  else
    echoerr "File \"" . b:bufname . "\" does not exist."
  endif
endfunction
" }}}

map <F5> :call OpenPDF()<cr><cr>
