""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim features, not Vi
set nocompatible

set hidden
set incsearch
set encoding=utf-8
" Show invisibles
set list
set listchars=tab:»-,trail:·,eol:¬
set guifont=Fira\ Code:h15
" set guifont=Menlo\ Regular:h13


" Vundle | Plugin manager
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'Kris2k/matchit'
Plugin 'airblade/vim-gitgutter'
Plugin 'bkad/camelcasemotion'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-system-copy'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'arithran/vim-delete-hidden-buffers'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Plugins CONFIGURATION

" ~~~~ ctrlp ~~~~

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|bower_components)$',
  \ 'file': '\v\.(exe|so|dll|eot|woff|ttf)$'
  \ }

" Opens in new window
let g:ctrlp_reuse_window  = 'startify'

" ~~~~ Ack ~~~~

let g:ackhighlight = 1
" Split rightward so as not to displace a left NERDTree
let g:ack_mappings = {
      \  'v': '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" ~~~~ Emmet ~~~~

let g:user_emmet_install_global = 0
autocmd FileType html,hbs,scss,css,mustache,javascript EmmetInstall
let g:user_emmet_leader_key='<C-E>'

" ~~~~ CamelCaseMotion ~~~~

call camelcasemotion#CreateMotionMappings('<leader>')


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

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" ~~~~ NERDTree ~~~~

let NERDTreeShowBookmarks=1
" CWD is changed whenever the tree root is changed
let NERDTreeChDirMode=2

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Detect filetype
filetype plugin on
" Enable syntax highlighting
syntax enable
" Show matching parens, brackets, etc.
set showmatch
" 256 colours please
set t_Co=256
" Solarized colour scheme...
colorscheme solarized
" ...with a dark background
set background=dark
" Italicised comments and attributes
highlight Comment cterm=italic ctermfg=68
highlight htmlArg cterm=italic ctermfg=136
" Ensure that italics carry over if I ever switch light/dark scheme
autocmd ColorScheme * highlight! Comment cterm=italic
autocmd ColorScheme * highlight! htmlArg cterm=italic

" markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown
" handlebars/mustache template to be considered as html
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
" Toggle NERDTree open
map <leader>nt :NERDTreeToggle<CR>
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
" Easier buffer delete
nnoremap <leader>d :bd<CR>
" easier quit
nnoremap <leader>q :q<cr>
" Move windows with <C-Direction>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Line jumps
noremap ]2 o<CR><Esc>
noremap [2 O<CR><Esc>j
noremap ]5 o<CR><CR><CR><CR><Esc>
noremap [5 O<CR><CR><CR><CR><Esc>j

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
noremap [] 080lbhi<Del><CR><Esc>


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
set wildignore+=*/node_modules/*,*/bower_components/*,*/tmp/*

" Automatically updates an open buffer if it has been changed outside of the
" current edit session, usually by an external program.
set autoread

" Automatically saves to disk the currently edited buffer upon leaving insert
" mode as well as after a text edit has occurred.
augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END


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

