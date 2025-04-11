" ==================================================================
" FILE     openPDF.vim
" OS       all
" MACHINE  all
" INFO     plugin: open corresponding pdf (e.g. to .tex files)
"
" DATE     11.04.2025
" OWNER    Bischofberger
" ==================================================================

" Description: Define a global variable containing the current environment's name
" if it hasn't been already defined.
" see: https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript/2577#2577
if !exists('g:env')
  if has('win64')
    let g:env = 'WINDOWS'
  else
    let g:env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif


" Function: OpenPDF() {{{
" Description: Open 'bufname.pdf' if existing
function! OpenPDF()
  let b:bufname = expand('%:r') . '.pdf'
  if filereadable(b:bufname)
    if g:env =~ 'LINUX'
      silent execute '!zathura ' . b:bufname . '&'
      redraw!
    endif
    if g:env =~ 'DARWIN'
      silent execute '!open -a preview ' . b:bufname . '&'
      redraw!
    endif
  else
    echoerr "File \"" . b:bufname . "\" does not exist."
  endif
endfunction
" }}}

map <F6> :call OpenPDF()<cr><cr>
