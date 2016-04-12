" ==================================================================
" FILE     .vim/ftplugin/markdown.vim
" MACHINE  all
" INFO     Personal makrdown vim config file, no plugin needed
"
" DATE     15.03.2016
" OWNER    Bischofberger
" ==================================================================

" Many MediaWiki wikis prefer line breaks only at the end of paragraphs
" (like in a text processor), which results in long, wrapping lines.
setlocal wrap linebreak
setlocal textwidth=0
setlocal formatoptions-=tc formatoptions+=lroq

setlocal autoindent  " auto indentation
setlocal sw=2        " 2 spaces indentation
setlocal expandtab   " intendation with spaces instead of tabs



