" ==================================================================
" FILE     dmenu.vim
" MACHINE  all
" INFO     plugin: use dmenu to open files quickly in vim
"
" DATE     02.03.2021
" OWNER    Bischofberger
" ==================================================================

"Strip the newline from the end of a string
function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction

"Find a file and pass it to cmd
function! DmenuOpen(cmd,type)
	if (a:type == "git")
		let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
	else
		let fname = Chomp(system("find . 
          \! -path '*/\.*' 
          \! -path '*/*.jpg' 
          \! -path '*/*.png' 
          \! -path '*/*.pdf' 
          \! -path '*/*.toc' 
          \! -path '*/*.aux' 
          \! -path '*/*.log' 
          \! -path '*/*.fls' 
          \! -path '*/*.fdb_latexmk' 
          \  -type f
          \  -printf '%P\n' 
          \| sort | dmenu -i -l 20 -p " . a:cmd))
	endif
	if empty(fname)
		return
	endif
	execute a:cmd . " " . fname
endfunction

" Mappings
map ,f :call DmenuOpen("e", "")<cr>
map ,g :call DmenuOpen("e", "git")<cr>
