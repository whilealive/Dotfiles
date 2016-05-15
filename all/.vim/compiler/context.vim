" Vim compiler file
" Compiler:     context
" Maintainer:   Bruno Bischofberger <bischofberger [at] fastmail [dot] fm>
" Last Change:  2016 Mai 11

if exists("current_compiler")
  finish
endif

let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" If Makefile exists, we use standard make (do not redefine makeprg)
" else we use rubber
if filereadable('Makefile')
  let current_compiler = "make"
else
  let current_compiler = "context"
  autocmd! QuickfixCmdPost * call s:SortUniqQFList()
  CompilerSet makeprg=context\ --silent\ --nonstopmode\ --noconsole\ \"%\"
endif

" The following two functions are needed to remove duplicate entries in the
" quickfix list which may occur if context is being run multiple times. The
" function s:SortUniqQFlist() will automatically be invoked by the
" QuickfixCmdPost event (see above).
" Functions are taken from: http://vim.wikia.com/wiki/Automatically_sort_Quickfix_list
function! s:CompareQuickfixEntries(i1, i2)
  if bufname(a:i1.bufnr) == bufname(a:i2.bufnr)
    return a:i1.lnum == a:i2.lnum ? 0 : (a:i1.lnum < a:i2.lnum ? -1 : 1)
  else
    return bufname(a:i1.bufnr) < bufname(a:i2.bufnr) ? -1 : 1
  endif
endfunction

function! s:SortUniqQFList()
  let sortedList = sort(getqflist(), 's:CompareQuickfixEntries')
  let uniqedList = []
  let last = ''
  for item in sortedList
    let this = bufname(item.bufnr) . "\t" . item.lnum
    if this !=# last
      call add(uniqedList, item)
      let last = this
    endif
  endfor
  call setqflist(uniqedList)
endfunction

CompilerSet errorformat=
      \%El.%l%m,
      \%+C\ %m,
      \%+C[]%m,
      \%+W%.%#at\ lines\ %l--%*\\d,
      \%W%.%#at\ lines\ %m,
      \%-G%\\s%#,
      \%-G%.%#,

let &cpo = s:keepcpo
unlet s:keepcpo
