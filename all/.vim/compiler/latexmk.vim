" Vim compiler file
" Compiler:     latexmk (LuaLaTex)
" Maintainer:   Bruno Bischofberger <bischofberger [at] fastmail [dot] fm>
" Last Change:  2017 Feb 18

if exists("current_compiler")
  finish
endif

let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" If Makefile exists, we use standard make (do not redefine makeprg)
" else we use latexmk
if filereadable('Makefile')
  let current_compiler = "make"
else
  let current_compiler = "latexmk"
  CompilerSet makeprg=latexmk\ --lualatex\ --interaction=nonstopmode\ --file-line-error\ \"%\"
endif

CompilerSet errorformat=
      \%f:%l:\ %m,
      \%f:%l-%\\d%\\+:\ %m

let &cpo = s:keepcpo
unlet s:keepcpo
