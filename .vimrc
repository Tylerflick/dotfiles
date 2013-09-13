
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initial options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set UTF Encoding
set encoding=utf-8 

" VIM only
set nocompatible

" Update file when modified outside of VIM
set autoread

" Turn off default mapping
let g:vim_arduino_map_keys = 0

" For powerline
set laststatus=2
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show the current position
set ruler

" Backspace fix
set backspace+=indent,eol,start	" fix backspace
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Enable modern searching
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highighting
syntax enable

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Line numbering
set number 


""""""""""""""""""""""""""""""""""""""""""
" Line Length Enforcements
""""""""""""""""""""""""""""""""""""""""""
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart indenting
set smartindent 
" Auto indent
set autoindent

" Linebreak on 500 characters
set linebreak
set tw=500

set wrap

" Allow mouse
set mouse=a

" 1 tab == 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick save and quit
nmap <c-x> :x<CR>a
imap <c-x> <ESC>:x<CR>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeMouseMode=2
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let laststatus = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => You Complete Me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf=1
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

highlight SyntasticErrorSign guifg=red guibg=white
highlight SyntasticWarningSign guifg=#af8700
highlight SyntasticErrorLine guibg=#d70000
highlight SyntasticWarningLine guibg=#af8700

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_arduino_checkers=['ycm']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_mode_map = { 'mode' : 'active',
			   \ 'active_filetypes' : ['c', 'cpp', 'python', 'arduino', 'javascript'] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" auto close documentation
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" auto bracketing
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {     {
inoremap {}     {}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 Bundle 'gmarik/vundle'
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'sudar/vim-arduino-syntax'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'jmcantrell/vim-virtualenv'
 Bundle 'pangloss/vim-javascript'
 Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed.
 "
" Turn filetype settings back on
filetype plugin indent on
