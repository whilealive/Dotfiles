" ==================================================================
" FILE     bruno-custom-mac.vim
" OS       macos
" MACHINE  MacBookPro1
" INFO     -
"
" DATE     11.07.2025
" OWNER    Bischofberger
" ==================================================================


" This color scheme is based on peachpuff but has proper line highlighting.
" (which is very slow on colorful files by the way...)

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")|syntax reset|endif

let colors_name = "bruno-custom"

hi SpecialKey term=bold ctermfg=4
hi NonText term=bold cterm=bold ctermfg=8
hi Directory term=bold ctermfg=4
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1
hi IncSearch term=reverse cterm=reverse
hi Search term=reverse ctermbg=3
hi MoreMsg term=bold ctermfg=2
hi ModeMsg term=bold cterm=bold
hi LineNr term=underline ctermfg=3
hi Question term=standout ctermfg=2
hi StatusLine term=bold,reverse cterm=bold,reverse
hi StatusLineNC term=reverse cterm=reverse
hi VertSplit term=reverse cterm=reverse
hi Title term=bold ctermfg=5
hi Visual term=reverse ctermfg=253 cterm=reverse
hi VisualNOS term=bold,underline cterm=bold,underline
hi WarningMsg term=standout ctermfg=1
hi WildMenu term=standout ctermfg=0 ctermbg=3
hi Folded term=standout ctermfg=white ctermbg=236
hi FoldColumn term=standout ctermfg=white ctermbg=239
hi DiffAdd term=bold ctermfg=7 ctermbg=4
hi DiffChange term=bold ctermbg=5
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6
hi DiffText term=reverse cterm=bold ctermbg=1
hi CursorLine term=bold ctermbg=239 cterm=bold

" Colors for syntax highlighting
hi Comment term=bold ctermfg=4
hi Constant term=underline ctermfg=1 
hi Special term=bold ctermfg=5 
hi Identifier term=underline ctermfg=6 
hi Statement term=bold ctermfg=3 
hi PreProc term=underline ctermfg=5 
hi Type term=underline ctermfg=2 
hi Ignore cterm=bold ctermfg=7 
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 
hi Todo term=standout ctermfg=0 ctermbg=3 

