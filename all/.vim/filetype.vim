" ==================================================================
" FILE     .vim/filetype.vim
" MACHINE  all
" INFO     - take python settings for all *.sage files, 
"            from wiki.sagemath.org/Tips
"          - Mail writing settings for mutt
"
" DATE     20.02.2014
" OWNER    Bischofberger
" ==================================================================

"python settings for .sage files
augroup filetypedetect
	au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END


"mutt mail editing, see ~/.vim/ftplugin/mail.vim
augroup filetypedetect
    autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END
