"
" ~/.vimrc
"

" Required "
set nocompatible
filetype off

" Plugins (vim-plug) "
call plug#begin('~/.vim/plugged')
" UI "
Plug 'scwood/vim-hybrid'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'lokaltog/vim-powerline'
" Languages "
Plug 'plasticboy/vim-markdown'
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

" UI 
set background=dark
colorscheme hybrid

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
