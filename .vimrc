""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim features, not Vi
set nocompatible
set encoding=utf-8
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Detect filetype
filetype plugin on
" Enable syntax highlighting
syntax enable
" 256 colours please
set t_Co=256
" Solarized colour scheme...
colorscheme solarized
" ...with a dark background
set background=dark
" Italicised comments and attributes
highlight Comment cterm=italic
highlight htmlArg cterm=italic
" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Space as a Leader
let mapleader = "\<Space>"
" Edit vimrc
nnoremap <leader>ev :tabnew ~/dotfiles/.vimrc<CR>
" Reload vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>
" Close all opened buffers
nnoremap <leader>ca :%bd<CR>
" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" Tabs mappings
nnoremap tN :tabnew<Space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<Space>
" Make `n`/`N` bring next search result to middle line
nnoremap n nzz
nnoremap N Nzz
" `G` skips to bottom of file and places line in middle of screen
nnoremap G :norm! Gzz<CR>
nnoremap G :norm! Gzz<CR>
" Jump Up / Jump down and places line in middle of screen
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" Toggle NERDTree open
nnoremap <leader>nt :NERDTree<CR>
" Select all
nnoremap <leader>a ggVG
" Copy all file content to clipboard
nnoremap <leader>ya :%y+<CR>
" Set ctrlp shortcut
nnoremap <C-p> :CtrlP<CR>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
"copy to outside buffer
vnoremap <leader>y "+y
" easier write
nmap <leader>w :w!<cr>
" easier quit
nmap <leader>q :q<cr>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neobundle | Plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins

NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim'
NeoBundle 'https://github.com/easymotion/vim-easymotion'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'https://github.com/scrooloose/nerdtree'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'mileszs/ack.vim'
NeoBundle 'https://github.com/digitaltoad/vim-pug'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'https://github.com/pangloss/vim-javascript'
NeoBundle 'https://github.com/airblade/vim-gitgutter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow
" Set the working directory to wherever the open file lives (can be problematic)
set autochdir
" set path+=**
" Show file options above the command line
set wildmenu
" Don't offer to open certain files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
" 2 spaces please
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" Round indent to nearest multiple of 2
set shiftround
" No line-wrapping
set nowrap




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual decorations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show status line
set laststatus=2
" Show what mode you're currently in
set showmode
" Show what commands you're typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Show invisibles
set list
set listchars=tab:ª-,trail:∑
" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number
" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let's make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we donøt type over our limit
set colorcolumn=+1
" Highlight current line
set cursorline

