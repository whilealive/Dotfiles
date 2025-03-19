" Vim compiler file
" Compiler:     latexmk (LuaLaTex)
" Maintainer:   Bruno Bischofberger <bischofberger [at] fastmail [dot] fm>
" Last Change:  2017 Apr 11

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
  CompilerSet makeprg=latexmk\ --lualatex\ --interaction=nonstopmode\ \"%\"
endif


" copied from official compiler file tex.vim
CompilerSet errorformat=%E!\ LaTeX\ %trror:\ %m,
	\%E!\ %m,
	\%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
	\%+W%.%#\ at\ lines\ %l--%*\\d,
	\%WLaTeX\ %.%#Warning:\ %m,
	\%Cl.%l\ %m,
	\%+C\ \ %m.,
	\%+C%.%#-%.%#,
	\%+C%.%#[]%.%#,
	\%+C[]%.%#,
	\%+C%.%#%[{}\\]%.%#,
	\%+C<%.%#>%.%#,
	\%C\ \ %m,
	\%-GSee\ the\ LaTeX%m,
	\%-GType\ \ H\ <return>%m,
	\%-G\ ...%.%#,
	\%-G%.%#\ (C)\ %.%#,
	\%-G(see\ the\ transcript%.%#),
	\%-G\\s%#,
	\%+O(%*[^()])%r,
	\%+O%*[^()](%*[^()])%r,
	\%+P(%f%r,
	\%+P\ %\\=(%f%r,
	\%+P%*[^()](%f%r,
	\%+P[%\\d%[^()]%#(%f%r,
	\%+Q)%r,
	\%+Q%*[^()])%r,
	\%+Q[%\\d%*[^()])%r

let &cpo = s:keepcpo
unlet s:keepcpo
