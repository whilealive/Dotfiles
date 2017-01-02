" ==================================================================
" FILE     snippy.vim
" MACHINE  all
" INFO     plugin: use snippy script as snippet manager for vim
"
" DATE     02.01.2017
" OWNER    Bischofberger
" ==================================================================

"nnoremap ,S  :! snippy <CR>:new<CR>:set paste<CR>"+p<CR>:set nopaste<CR>
"nnoremap ,sn :! snippy <CR>"+p=}<CR>}dd?+++<CR>cw

if !exists("g:snippy_command")
  let g:snippy_command = "snippy"
endif

let b:place_holder = "<+++>"

function! SnippyPreview()
  silent execute "!" . g:snippy_command
  redraw!
  if v:shell_error == 0
    "create new window, horizontally splitted
    new
    "paste CLIPBOARD
    set paste
    normal! "+p
    set nopaste
  endif
endfunction

function! SnippyPaste()
  silent execute "!" . g:snippy_command
  redraw!
  if v:shell_error == 0
    "paste CLIPBOARD
    normal! "+p
    "indent pasted block
    normal! =}
    "delete blank line at the end (was needed for indenting)
    normal! }dd
    "search backward for placeholder
    if search(b:place_holder, 'bW') != 0
      call feedkeys('cw')
    endif
  endif
endfunction

nnoremap ,S  :call SnippyPreview()<cr>
nnoremap ,sn :call SnippyPaste()<cr>
