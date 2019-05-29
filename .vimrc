""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " Use Vim features, not Vi.
set backspace=indent,eol,start " Enable `<BS>`, `<Del>`, `CTRL-W` and `CTRL-U` in Insert mode.
set hidden                     " Prevent Vim from complaining when switch from an unsaved buffer to another.
set history=1000               " Set bigger history of executed commands.
set showcmd                    " Show what commands you're typing in bottom right (e.g. daw).
set showmode                   " Show what mode you're currently in bottom left corner.
set exrc                       " Enable project specific vimrc.
set updatetime=250             " Write swapfiles to disk a little sooner










""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set title                                   " Show file title in terminal tab.
set laststatus=2                            " Always show status line.
set splitright                              " Open splits to the right...
set splitbelow                              " ... or below.
set listchars=tab:▸\ ,trail:·,eol:¬         " Characters for invisibles (`set list`).
set relativenumber                          " Set relative line numbers...
set number                                  " ...but absolute numbers on the current line (hybrid numbering).
set cursorline                              " Highlight current line.
set textwidth=80                            " Force the cursor onto a new line after 80 characters.
autocmd FileType gitcommit set textwidth=72 " However, in Git commit messages, let's make it 72 characters.
set colorcolumn=+1                          " Colour the 81st (or 73rd) column so that we don't type over our limit.
colorscheme solarized                       " Solarized colour scheme...
set background=dark                         " ... with a dark background.
set t_Co=256                                " 256 colours please.
let g:solarized_diffmode="high"             " Set high visibility for diff mode.
set guifont=Fira\ Code:h15

set wildmenu " Show file options above the command line.

" Don't offer to open certain files/directories.
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css,*.min.css
set wildignore+=*/node_modules/*,*/bower_components/*

" Automatically equalize splits when Vim is resized.
autocmd VimResized * wincmd =

" Set relative number just for normal mode.
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent " New lines inherit the indentation of previous lines.
filetype plugin indent on " Smart auto indentation (instead of old smartindent option).

" Help
"
" tabstop - specifies the width of a tab character.
" expandtab - when enabled, causes spaces to be used in place of tab characters.
" softtabstop - when enabled, fine tunes the amount of whitespace to be inserted.
" shiftwidth - determines the amount of whitespace to insert or remove using the indentation commands in normal mode.

set expandtab     " Use spaces in place of tab character.
set tabstop=2     " Width of tab if tabs are present.
                  " In noexpandtab mode, softtabstop trumps tabstop until tabs match
                  " a common denominator of tabstop.
set softtabstop=2 " So that backspacing is consistent to tabing.
set shiftwidth=2  " 2 whitespace when indenting in normal mode.

" Round indent to nearest multiple of 2
set shiftround





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text rendering options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

language en_US.utf-8                       " Force language to english.
set encoding=utf-8                         " utf-8 FTW.
set showmatch                              " Show matching parens, brackets, etc.
syntax enable                              " Enable syntax highlighting.
highlight Comment cterm=italic ctermfg=68  " Italicised comments...
highlight htmlArg cterm=italic ctermfg=136 " ... and attributes

" Ensure that italics carry over if I ever switch light/dark scheme
autocmd ColorScheme * highlight! Comment cterm=italic
autocmd ColorScheme * highlight! htmlArg cterm=italic

" Omni completion is not usually enabled by default. These 2 lines turn it on.
filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd FileType markdown syntax sync fromstart               " Force a full file syntax computation when opening Markdown files.
autocmd BufNewFile,BufRead *.md set filetype=markdown         " Markdown also starts with .md
autocmd BufNewFile,BufRead *.hbs,*.mustache set filetype=html " Handlebars/mustache template to be considered as html








""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch  " Find the next match as I type the seach.
set hlsearch   " Highlight searches by default.
set ignorecase " Ignore case when search...
set smartcase  " ... unless I type a capital letter in search term.





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap and backup file options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set directory=$HOME/.vim-directory// " Move swap files out of the editing folder.
set nobackup                         " No backup mechanism...
set nowritebackup                    " ...what so ever





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External changes tracking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Track change on file outside of Vim.
" Do not update changed buffer unless
" - Invoking the shell via command
" - Calling :checktime
set autoread 

" Call checktime
" - *once* after 'updatetime' (250ms) without doing anything
" - and then when hitting a key after the hold
"
" https://gist.github.com/j-manu/840172
" https://www.reddit.com/r/vim/comments/29iq9s/vim_detecting_changes_on_disk/
autocmd CursorHold,CursorHoldI * checktime

" Give feedback that file has change.
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins area
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin manager => https://github.com/junegunn/vim-plug
"
" Brief help
" :PlugInstall - Install plugins
" :PlugUpdate - Install or update plugins
" :PlugUpgrade - Upgrade vim-plug itself
" :PlugClean - Remove folder of not found (in rc) plugins (source rc file first)

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

source ~/.vim/partials/.vimrc-plugins

" Initialize plugin system
call plug#end()

source ~/.vim/partials/.vimrc-plugins-config





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/partials/.vimrc-keymappings





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" JSON format
com! FormatJSON %!python -m json.tool
