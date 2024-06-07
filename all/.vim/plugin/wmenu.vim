" ==================================================================
" FILE     wmenu.vim
" MACHINE  all
" INFO     plugin: use wmenu (wayland) to open files quickly in vim
"
" DATE     05.06.2024
" OWNER    Bischofberger
" ==================================================================

"Strip the newline from the end of a string
function! Chomp(str)
	return substitute(a:str, '\n$', '', '')
endfunction

"Find a file and pass it to cmd
function! WmenuOpen(cmd,type)
	if (a:type == "git")
		let fname = Chomp(system("git ls-files | wmenu -i -l 20 -p " . a:cmd))
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
          \! -path '*/*.out' 
          \! -path '*/*.fdb_latexmk' 
          \! -path '*/*.class' 
          \! -path '*/*.xopp' 
          \  -type f
          \  -printf '%P\n' 
          \| sort | wmenu -i -l 20 -p " . a:cmd))
	endif
	if empty(fname)
		return
	endif
	execute a:cmd . " " . fname
endfunction

" Mappings
map ,f :call WmenuOpen("e", "")<cr>
map ,g :call WmenuOpen("e", "git")<cr>
