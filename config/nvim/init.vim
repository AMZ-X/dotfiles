"
" ~/.config/nvim/init.vim
"

" required 
if &compatible
  set nocompatible
endif
filetype off

" dein (neovim plugin manager)
set rtp+=/usr/share/vim/vimfiles
call dein#begin(expand('~/.cache/dein'))
call dein#add('tomasr/molokai')
call dein#add('airblade/vim-gitgutter')
call dein#end()

" auto-install missing packages on startup
" otherwise run: call dein#install() in nvim
if dein#check_install()
  call dein#install()
endif
filetype plugin on

" general 
set number
set cursorline
set autoread

syntax on

" molokai (color scheme) 
let g:rehash256 = 1
colorscheme molokai 

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
set clipboard+=unnamedplus

" custom key-bindings 
let mapleader = '\'
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>

" copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" paste from clipboard
vnoremap <leader>p "+p
nnoremap <leader>p "+p
