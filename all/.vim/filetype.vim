" ==================================================================
" FILE     .vim/filetype.vim
" MACHINE  all
" INFO     - take python settings for all *.sage files, 
"            from wiki.sagemath.org/Tips
"          - Mail writing settings for mutt
"          - etc.
"
" DATE     08.05.2016
" OWNER    Bischofberger
" ==================================================================

augroup filetypedetect
	"mutt mail editing, see ~/.vim/ftplugin/mail.vim
	autocmd BufRead,BufNewFile *mutt-* setfiletype mail
	"python settings for .sage files
	autocmd BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
	" markdown (GitHub)
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype markdown
augroup END
