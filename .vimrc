" Force language to english
language en_US.utf-8

set encoding=utf-8

" Use Vim features, not Vi
set nocompatible

" Prevent Vim from complaining when switch from an unsaved buffer to another.
set hidden

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

" Enable `<BS>`, `<Del>`, `CTRL-W` and `CTRL-U` in Insert mode.
set backspace=indent,eol,start




" Vundle | Plugin manager
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" required
filetype off
set omnifunc=syntaxcomplete#Complete

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'





" Plugins
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Text objects
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'whatyouhide/vim-textobj-xmlattr'

" Language support/syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'suan/vim-instant-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'mxw/vim-jsx'
Plugin 'editorconfig/editorconfig-vim'

" Buffer management
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'arithran/vim-delete-hidden-buffers'

" Customization
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Extensions
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-sort-motion'
Plugin 'digitaltoad/vim-pug'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/vitality.vim'
Plugin 'SirVer/ultisnips'
Plugin 'shime/vim-livedown'
" After :PluginInstall, Go to '~/dotfiles/.vim/bundle/tern_for_vim' folder and type 'npm install'
Plugin 'ternjs/tern_for_vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required





" Plugins CONFIGURATION
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~ netrw ~~~~
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 25

" ~~~~ ternjs ~~~~

" This will automatically hide the preview window whenever you're done auto-completing.
autocmd CompleteDone * pclose
"let g:tern_map_keys=1
"let g:tern_show_argument_hints='on_hold'

" ~~~~ airline ~~~~

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" ~~~~ Vim-livedown ~~~~

" the port on which Livedown server will run
let g:livedown_port = 4242

" the browser to use
let g:livedown_browser = "safari"

let g:vim_markdown_no_default_key_mappings = 1

" ~~~~ Ack ~~~~

let g:ackhighlight = 1

" ~~~~ Emmet ~~~~

let g:user_emmet_install_global = 0
autocmd FileType html,hbs,scss,css,mustache,javascript EmmetInstall
let g:user_emmet_leader_key='<C-E>'


" ~~~~ Instant Mardown  ~~~~
let g:instant_markdown_autostart = 1

" ~~~~ EasyAlign Conf ~~~~

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ~~~~ Vim-javascript ~~~~

let g:javascript_conceal_NaN                       = "ℕ"
let g:javascript_conceal_arrow_function            = "⇒"
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_noarg_arrow_function      = "🞅"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_prototype                 = "¶"
let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_static                    = "•"
let g:javascript_conceal_super                     = "Ω"
let g:javascript_conceal_this                      = "@"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:javascript_plugin_jsdoc                      = 1


" ~~~~ UltiSnips ~~~~

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/dotfiles/.vim/snippets/"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ~~~~ editorconfig-vim ~~~~

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']





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

" Space as a Leader
let mapleader = "\<Space>"

" Edit vimrc
nnoremap <leader>ev :tabnew ~/dotfiles/.vimrc<CR>
" Reload vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>
" Start type for Ack search
nnoremap <leader>f :Ack! "
" Open netrw in a left split
nnoremap <leader>o :Vex<CR>
" Improve buffer switching
nnoremap gb :ls<CR>:b<Space>
" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Resize even faster.
nnoremap <S-Up>    :resize +10<CR>
nnoremap <S-Down>  :resize -10<CR>
nnoremap <S-Left>  :vertical resize +10<CR>
nnoremap <S-Right> :vertical resize -10<CR>

" Add space before cursor in normal mode
nnoremap SS i<Space><Esc>l
" Add space after cursor in normal mode
nnoremap ss a<Space><Esc>h

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
nnoremap <C-b> <C-b>zt
" Jump back / Jump forward and places line in middle of screen
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" search for the selected text
vnoremap // y/\V<C-R>"<CR>
" search for the selected text within CWD
vnoremap <C-f> y:Ack! "<C-R>"" --

" easier write
nmap <leader>w :w!<cr>

" Close all hidden buffers
nnoremap <leader>dhb :DeleteHiddenBuffers<CR>
" Close all opened buffers but the current one
nnoremap <leader>dob :BufOnly<CR>
" Close all opened buffers
nnoremap <leader>dab :%bd<CR>

" Easier quit
nnoremap <leader>q :q<cr>

" Move windows with <C-Direction>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Load template
noremap !htmlsp :r ~/dotfiles/.vim/templates/section-part.html<CR>ki<Del><Esc>j$a
noremap !htmlst :r ~/dotfiles/.vim/templates/section-title.html<CR>ki<Del><Esc>jj$a
noremap !htmlc :r ~/dotfiles/.vim/templates/comment.html<CR>ki<Del><Esc>==<Esc>ela

noremap !cssic A <Esc>:r ~/dotfiles/.vim/templates/inline-comment.css<CR>k<S-j>f]i
noremap !cssc :r ~/dotfiles/.vim/templates/comment.css<CR>ki<Del><Esc><C-V>2j==<Esc>jf.i
noremap !csssp :r ~/dotfiles/.vim/templates/section-part.css<CR>ki<Del><Esc>$a
noremap !cssst :r ~/dotfiles/.vim/templates/section-title.css<CR>ki<Del><Esc>jf#a

noremap !scssic A <Esc>:r ~/dotfiles/.vim/templates/inline-comment.scss<CR>k<S-j>f]i
noremap !scssp :r ~/dotfiles/.vim/templates/section-part.scss<CR>ki<Del><Esc>$a
noremap !scssst :r ~/dotfiles/.vim/templates/section-title.scss<CR>ki<Del><Esc>jf#a

" Cut line to fit in the 80 column textwidth
noremap [] 080lBhi<Del><CR><Esc>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Quick search for files
noremap <C-P> :e **/*
cnoremap <leader>v <C-B>vsp<Space><bar><Space><CR>
cnoremap <leader>s <C-B>sp<Space><bar><Space><CR>



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
set wildignore+=*/node_modules/*,*/bower_components/*,*/tmp/*,*/public/*

" Automatically updates an open buffer if it has been changed outside of the
" current edit session, usually by an external program.
set updatetime=2000
set autoread
" check one time after 2s of inactivity in normal mode
au CursorHold * if !bufexists("[Command Line]") | checktime | endif

" Automatically saves to disk the currently edited buffer upon leaving insert
" mode as well as after a text edit has occurred.
" augroup autoSaveAndRead
"     autocmd!
"     autocmd TextChanged,InsertLeave,FocusLost * silent! wall
"     autocmd CursorHold * silent! checktime
" augroup END


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

" Show status line
set laststatus=2

" Show what mode you're currently in
set showmode

" Show what commands you're typing
set showcmd

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
