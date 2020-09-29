" VARIABLES
" =========

" Plugins variables
" -----------------

let g:netrw_banner = 0
let g:netrw_liststyle = 0

    




" PLUGINS
" =======

" Plugin manager => https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Text objects
" ------------

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'jceb/vim-textobj-uri'
Plug 'wellle/targets.vim'

" Language support/syntax highlighting
" ------------------------------------

" Syntax checkers/linters
" -----------------------

" Buffer management
" -----------------

" UI/UX Extensions
" ----------------

" Extensions
" ----------

" Applications
" ------------

call plug#end()





" FUNCTIONS
" =========





" SETTINGS
" ========

" General configuration
" ---------------------

set nocompatible
language en_US.utf-8
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set history=1000
set exrc


" User Interface
" --------------

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


" Indentation
" -----------

set autoindent
filetype plugin indent on

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround





" MAPPINGS
" ========

let mapleader = "\<Space>"

nnoremap <leader>ev :tabnew ~/.vimrc<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

nnoremap j gj
nnoremap k gk

" <S-arrow> to resize splits (not optimal yet).
nnoremap <S-right> :vertical resize +2<CR>
nnoremap <S-left>  :vertical resize -2<CR>
nnoremap <S-down>  :resize -2<CR>
nnoremap <S-up>    :resize +2<CR>






" AUTOCOMMANDS
" ============





" COMMANDS
" ========
