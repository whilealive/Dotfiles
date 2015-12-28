" ==================================================================
" FILE     .vim/plugin/brackets.vim
" MACHINE  all
" INFO     auto close brackets
"          requires at least vim-7.4.849
"
" DATE     22.12.2015
" OWNER    Bischofberger
" ==================================================================

inoremap {      {}<C-G>U<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<C-G>U<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<C-G>U<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

inoremap $      $$<C-G>U<Left>
inoremap $<CR>  $<CR>$<Esc>O
inoremap $$     $
