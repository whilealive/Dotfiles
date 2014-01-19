" ==================================================================
" FILE     .vim/filetype.vim
" MACHINE  all
" INFO     take python settings for all *.sage files, 
"          from wiki.sagemath.org/Tips
"
" DATE     19.01.2014
" OWNER    Bischofberger
" ==================================================================

augroup filetypedetect
	au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END
