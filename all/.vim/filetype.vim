" ==================================================================
" FILE     filetype.vim
" MACHINE  all
" INFO     
"
" DATE     19.07.2022
" OWNER    Bischofberger
" ==================================================================

augroup filetypedetect
	" TeX - prevent vim from using plaintex as filetype
	autocmd BufRead,BufNewFile *.{tex} setfiletype tex
	" markdown (GitHub)
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype text
	autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype text
augroup END
