" ==================================================================
" FILE     snippy.vim
" OS       all
" MACHINE  all (wayland for linux)
" INFO     plugin: use snippy script as snippet manager for vim
"          with some fallback method for macOS using netrw
"
" DATE     15.06.2025
" OWNER    Bischofberger
" ==================================================================

" Description: Define a global variable containing the current environment's name {{{
"   if it hasn't been already defined.
"   see: https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript/2577#2577
if !exists('g:env')
  if has('win64')
    let g:env = 'WINDOWS'
  else
    let g:env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif
" }}}


" Description: define placeholder. This is where cursor jumps to after {{{
"   pasting snippet content
"   Placeholder must start with < and end with >. Otherwise replacing it
"   in SnippyPaste() could fail.
if !exists("g:snippy_placeholder")
  let g:snippy_placeholder = "<+++>"
endif
" }}}


" Description: (linux only) snippy bash script uses dmenu/wmenu {{{
"   to list files in ~/.snippy folder
if !exists("g:snippy_command")
  let g:snippy_command = "snippy"
endif
" }}}


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


" Description: netrw solution for macOS without dmenu/wmenu {{{
"   Works for linux as well, just uses netrw plugin
"   Some stuff taken from `https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/`
function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> <Leader>dd <CR>:%y<CR>:bd<CR>
endfunction
" }}}


" Description: define the mappings
" linux: both methods will work
" macOS: only netrw solution should be enabled
if g:env =~ 'LINUX'
  nnoremap ,S  :call SnippyPreview()<cr>
  nnoremap ,sn :call SnippyPaste()<cr>
  "nnoremap ,SS :Vexplore ~/vimsnippy/<cr>
endif

if g:env =~ 'DARWIN'
  nnoremap ,S :Vexplore ~/vimsnippy/<cr>
endif

