" ==================================================================
" FILE      .vim/ftplugin/tex.vim
" MACHINE   all
" INFO      Personal tex.vim config file, in addition to the standard
"           texrc file in /usr/share/vim/vimfiles/ftplugin/latex-suite/
"
" DATE      19.02.2014
" OWNER     Bischofberger
" ==================================================================


set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set grepprg=grep\ -nH\ $*

set sw=2   " little indentation
set nocul  " disable cursorline, too slow
set tw=90  " limited textwidth for readability
"set formatoptions=tl    " automatic wrapping
"set formatoptions+=a    " automatic wrapping

" if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" compile stuff
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,aux'
let g:Tex_ViewRule_pdf = 'zathuratab'

" set prompted environments at F5 key
let g:Tex_PromptedEnvironments = '\[,gather*,gather,multline,cases,pmatrix,align'

" folding rules (for mathematics)
let g:Tex_FoldedEnvironments = 'Def,Ex,Thm,Prop,Lem,Cor,Rem,Case,proof,thebibliography'
