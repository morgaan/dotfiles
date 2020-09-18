"===============================
" General configuration options
"===============================

set nocompatible
language en_US.utf-8
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set history=1000
set exrc


" =======================
" User Interface options
" =======================

colorscheme solarized8
set background=dark
let g:solarized_diffmode="high"

set title
set laststatus=2
set number
set splitright
set splitbelow
set listchars=tab:▸\ ,space:·,trail:·,eol:¬
set cursorline
set scrolloff=3
set colorcolumn=+1
set termguicolors
set guifont=Victor\ Mono:h16
set wildmenu

" Cursor behaviour
set guicursor=n-v-c-ci-i:block-Cursor-blinkwait1-blinkon150-blinkoff150

" Don't offer to open certain files/folders
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css,*.min.css
set wildignore+=*/node_modules/*,*/bower_components/*


" ====================
" Indentation options
" ====================

set autoindent
filetype plugin indent on

set noexpandtab
set tabstop=4
