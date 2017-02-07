" ==================================================================
" FILE     .vim/filetype.vim
" MACHINE  all
" INFO     - Mail writing settings for mutt
"          - etc.
"
" DATE     07.02.2017
" OWNER    Bischofberger
" ==================================================================

augroup filetypedetect
	"mutt mail editing, see ~/.vim/ftplugin/mail.vim
	autocmd BufRead,BufNewFile *mutt-* setfiletype mail
	" markdown (GitHub)
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype markdown
augroup END
