" ==================================================================
" FILE     tex.vim
" MACHINE  all
" INFO     Personal tex.vim config file
"
" DATE     26.07.2023
" OWNER    Bischofberger
" ==================================================================

" add myitem etc. (itemize package) environment to indentation rules (see indent/tex.vim)
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography\|myenum\|myitem\|mydotitem\|alphenum\|tabbedenum\|checklist'

" activate .sty-mode by default (allow underscores etc.)
let g:tex_stylish = 1

compiler latexmk

" compile .tex-file with make (using llmk if no MAKEFILE is existent)
nnoremap <buffer> <silent> <F5> :wa<cr>:make!<cr><cr>:cw 20<cr>:cbo<cr><C-W>k

" soft-wrap
"set formatoptions=l
"set columns=100
"autocmd VimResized * if (&columns > 100) | set columns=100 | endif
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

" possible alternative: indents wrapped lines like
" \item blah bkah blah
"       blahk, aölkj a 
"       afakdfjaf 
"set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*\\\|^\\s*\\\\item\\s*
"set showbreak=""
"set breakindentopt+=list:-1
