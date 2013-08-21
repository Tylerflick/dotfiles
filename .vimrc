set nocompatible               " be iMproved
filetype off                   " required!
syntax enable
let g:solarized_termtrans = 1
set backspace+=indent,eol,start
set background=dark
set number " Line numbering
set smartindent " Auto indent
set mouse=a " Allow mouse
colorscheme solarized
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Auto-Bracketing
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {     {
inoremap {}     {}

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 Bundle 'Valloric/YouCompleteMe'

 " Arduino syntax highlighting:
 Bundle 'sudar/vim-arduino-syntax'

 " C family syntax awareness
 Bundle 'scrooloose/syntastic'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
