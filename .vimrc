""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Use Vim features, not Vi.

set backspace=indent,eol,start " Enable `<BS>`, `<Del>`, `CTRL-W` and `CTRL-U` in Insert mode.

set history=1000 " Set bigger history of executed commands.

set showcmd " Show what commands you're typing.

set showmode " Show what mode you're currently in.

set autoread " Track change on file outsite Vim. Does not reload the buffer though.
set updatetime=250 " Set time interval for CursorHold.
" Trigger when cursor stops moving or on buffer change or terminal focus.
au CursorHold,CursorHoldI,FocusGained,BufEnter * if mode() != 'c' | checktime | endif
" Give feedback that filed has change.
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Enable project specific vimrc
set exrc

" Prevent Vim from complaining when switch from an unsaved buffer to another.
set hidden

" Force language to english
language en_US.utf-8

set encoding=utf-8



" Start matching+highlighting vearch pattern as I type.
set incsearch
set hlsearch

set guifont=Fira\ Code:h15
" set guifont=Menlo\ Regular:h13

" Move swap files out of the editing folder.
set backupdir=~/.vim-backupdir//
set directory=~/.vim-directory//

" Tell Vim to look in my home directory for more ctags
set tags+=tags;$HOME

" Set the path and some file extensions for jumping to files
set path=.,/usr/include,,
set suffixesadd+=.scss


set omnifunc=syntaxcomplete#Complete


" Plugin manager (vim-plug) + Plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://github.com/junegunn/vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Brief help
" :PlugInstall - Install plugins
" :PlugUpdate - Install or update plugins
" :PlugUpgrade - Upgrade vim-plug itself
" :PlugClean - Remove folder of not found (in rc) plugins (source rc file first)

source ~/.vim/partials/.vimrc-plugins

" Initialize plugin system
call plug#end()

source ~/.vim/partials/.vimrc-plugins-config







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Detect filetype
filetype plugin on

" Enable syntax highlighting
syntax enable

" Force a full file syntax computation when opening Markdown files
autocmd FileType markdown syntax sync fromstart

" Show matching parens, brackets, etc.
set showmatch

" Solarized colour scheme...
colorscheme solarized
" ...with a dark background
set background=dark
" 256 colours please
set t_Co=256
" Set high visibility for diff mode
let g:solarized_diffmode="high"

" Italicised comments and attributes
highlight Comment cterm=italic ctermfg=68
highlight htmlArg cterm=italic ctermfg=136

" Ensure that italics carry over if I ever switch light/dark scheme
autocmd ColorScheme * highlight! Comment cterm=italic
autocmd ColorScheme * highlight! htmlArg cterm=italic

" Markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown
" Handlebars/mustache template to be considered as html
autocmd BufNewFile,BufRead *.hbs,*.mustache set filetype=html





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/partials/.vimrc-keymappings



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open splits to the right or below; more natural than the default
set splitright
set splitbelow

" Show file options above the command line
set wildmenu

" Don't offer to open certain files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*,*tmp/*,*/public/*,.git,.DS_Store
set wildignore+=*~,*.swp,*.tmp




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically equalize splits when Vim is resized
autocmd VimResized * wincmd =

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 2 spaces please
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Round indent to nearest multiple of 2
set shiftround

se fo-=2 ai " fixes https://github.com/tpope/vim-markdown/issues/98

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual decorations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show status line
set laststatus=2


" Show file title in terminal tab
set title

" Show invisibles.
" set list
set listchars=tab:▸\ ,trail:·,eol:¬

" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number

" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let's make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don't type over our limit
set colorcolumn=+1

" Highlight current line
set cursorline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" JSON format
com! FormatJSON %!python -m json.tool










" Set relative number just for normal mode
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber
