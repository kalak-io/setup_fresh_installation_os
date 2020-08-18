"*****************************************************************************
" PERSONAL VIMRC
"*****************************************************************************
if &compatible
      set nocompatible
  endif

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" List of plugins
Plugin 'lifepillar/vim-solarized8'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set autoindent

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"" Directories for swp files
set nobackup
set noswapfile

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set linebreak

set background=dark
colorscheme solarized8

"*****************************************************************************
"" Plugins Configuration
"*****************************************************************************
"" ALE
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

"*****************************************************************************
"" Mappings
"*****************************************************************************
imap cll console.log()<Esc>==f(a
