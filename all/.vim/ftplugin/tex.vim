" ==================================================================
" FILE     .vim/ftplugin/tex.vim
" MACHINE  desktop
" INFO     Personal tex.vim config file, in addition to the 
"          standard texrc file in 
"          /usr/share/vim/vimfiles/ftplugin/latex-suite/
"
" DATE     22.12.2013
" OWNER    Bischofberger
" ==================================================================


" little indentation
set sw=2

" if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" compile to pdf directly
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,aux'

" set prompted environments at F5 key
let g:Tex_PromptedEnvironments = '\[,gather*,gather,multline,cases,pmatrix,align'

" folding rules (for mathematics)
let g:Tex_FoldedEnvironments = 'Def,Ex,Thm,Prop,Lem,Cor,Rem,Case,proof,thebibliography'
