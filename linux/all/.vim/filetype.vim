" ==================================================================
" FILE     filetype.vim
" OS       all
" MACHINE  all
" INFO     
"
" DATE     27.01.2023
" OWNER    Bischofberger
" ==================================================================

augroup filetypedetect
	" TeX - prevent vim from using plaintex as filetype
	autocmd BufRead,BufNewFile *.{tex} setfiletype tex
augroup END
