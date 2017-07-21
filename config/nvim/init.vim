"
" ~/.vimrc
"

" required "
if &compatible
  set nocompatible
endif
filetype off

" Dein (Neovim plugin manager)
set rtp+=/usr/share/vim/vimfiles
call dein#begin(expand('~/.cache/dein'))
call dein#add('tomasr/molokai')
call dein#add('airblade/vim-gitgutter')
call dein#end()

" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif
filetype plugin on


" General "
set number
set cursorline
set autoread

syntax on

" Molokai 
let g:rehash256 = 1
colorscheme molokai

" JSX
let g:jsx_ext_required = 0 

" disable swap files
set noswapfile
set nobackup
set nowb

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" enable mouse support
set mouse=a

" clipboard support
set clipboard=unnamed


" custom key-bindings "

let mapleader = '\'
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>

" copy to clipboard
vnoremap <leader>y :+y<CR>
nnoremap <leader>y :+y<CR>

" paste from clipboard
vnoremap <leader>p :+p<CR>
nnoremap <leader>p :+p<CR>

" enable mouse support
set mouse=a


