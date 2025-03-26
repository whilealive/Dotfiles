" ==================================================================
" FILE     snippy.vim
" OS       linux
" MACHINE  all (wayland)
" INFO     plugin: use snippy script as snippet manager for vim
"
" DATE     23.07.2024
" OWNER    Bischofberger
" ==================================================================

if !exists("g:snippy_command")
  let g:snippy_command = "snippy"
endif

" Note: Placeholder starts with < and ends with >. Otherwise replacing it
" in SnippyPaste() could fail.
if !exists("g:snippy_placeholder")
  let g:snippy_placeholder = "<+++>"
endif

" Function: SnippyPreview() {{{
" Description: Opens a new window and pastes the snippet (i.e. content of
"   CLIPBOARD) into that window so that we can explore it and copy-paste parts
"   of it. Use :bd! to close the extra window.
function! SnippyPreview()
  silent execute "!" . g:snippy_command
  redraw!
  if v:shell_error == 0
    "create new window, horizontally splitted
    new
    "paste CLIPBOARD
    call CopyWaylandClipboardToXRegister()  "see .vimrc
    set paste
    normal! "xp
    set nopaste
  endif
endfunction
" }}}

" Function: SnippyPaste() {{{
" Description: Pastes the snippet (i.e. content of CLIPBOARD) directly into
"   the current position and intends block. If a placeholder is found it will
"   jumb to that position automatically.
function! SnippyPaste()
  silent execute "!" . g:snippy_command
  redraw!
  if v:shell_error == 0
    "paste CLIPBOARD
    call CopyWaylandClipboardToXRegister()  "see .vimrc
    normal! "xp
    "indent pasted block
    normal! =}
    "delete blank line at the end (was needed for indenting)
    normal! }dd
    "search backward for placeholder
    if search(g:snippy_placeholder, 'bW') != 0
      call feedkeys('cf>')
    endif
  endif
endfunction
" }}}

nnoremap ,S  :call SnippyPreview()<cr>
nnoremap ,sn :call SnippyPaste()<cr>
