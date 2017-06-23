"
" ~/.vimrc
"

" Required "
set nocompatible
filetype off

" Plugins (vim-plug) "
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'lokaltog/vim-powerline'
" languages plugins
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'rip-rip/clang_complete'
call plug#end()

" General "
set number
set cursorline
set autoread

syntax on

" Molokai (dark version) 
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

" custom key-bindings "

let mapleader = '\'
nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>

