" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     06.01.2021
" OWNER    Bischofberger
" ==================================================================

setlocal sw=2        " little indentation
setlocal expandtab   " tex intendation works better with spaces

" add myitem etc. (itemize package) environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|myenum\|myitem\|mydotitem\|alphenum\|tabbedenum\|checklist'

compiler latexmk

" compile .tex-file with make (using llmk if no MAKEFILE is existent)
nnoremap <buffer> <silent> <F6> :w<cr>:wa<cr>:make<cr><cr><cr>:cw<cr>

" soft-wrap
set formatoptions=l
set columns=100
autocmd VimResized * if (&columns > 100) | set columns=100 | endif
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" update norm: updates filename/date in \SetNorm{filename}{date} macro
nnoremap ,<F4> magg
      \/\\SetNorm<CR>
      \S\SetNorm{<ESC>
      \"%p
      \a}{<ESC>
      \"=strftime("%d.%m.%Y")<CR>p
      \a}<ESC>
      \'a
