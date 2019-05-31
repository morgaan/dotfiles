""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ~~~~~~~~~~~~~~~~~~~~~~~~ Plugins declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General configuration options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " Use Vim features, not Vi.
language en_US.utf-8           " Force language to english.
set encoding=utf-8             " utf-8 FTW.
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
set listchars=tab:▸\ ,trail:·,eol:¬         " Characters for invisibles (set list).
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





"*******************************************************************************
" Indentation options
"*******************************************************************************

set autoindent " New lines inherit the indentation of previous lines.
filetype plugin indent on " Smart auto indentation (instead of old smartindent option).

" Indentation settings help:
"
" tabstop     : how many columns a tab should be made up of in the editor view.
" expandtab   : when enabled, insert the appropriate number of spaces when in insert mode.
" shiftwidth  : how many columns text will be indented when using indent operations (such as << or >>) in normal or visual mode
" softtabstop : when enabled,
"                - softtabstop < tabstop, noexpandtab
"                  This will result in a combination of tabs and spaces to make up the total spacing .
"                - softtabstop == tabstop, noexpandtab
"                  This will always force the use of tabs.
"                - expandtab
"                  The value of softtabstop will be ignored and spaces will be forced
"
" src: https://federico-lox.github.io/development/tabs-stop-the-truth-about-vim-tab-spaces.html
"
" shifround   : round indent to nearest multiple of set shiftwidth on indent
"               operations (>> << in Normal mode, CTRL-T CTRL-D in Insert mode)
"
set expandtab    " Use spaces in place of tab character.
set tabstop=2    " Existing tabs are visually rendered as 2 columns.
set shiftwidth=2 " Indent by 2 columns.
set shiftround   " Round indent to nearest multiple of set shiftwidth.





"*******************************************************************************
" Text rendering options
"*******************************************************************************

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





"*******************************************************************************
" Search options
"*******************************************************************************

set incsearch  " Find the next match as I type the seach.
set hlsearch   " Highlight searches by default.
set ignorecase " Ignore case when search...
set smartcase  " ... unless I type a capital letter in search term.





"*******************************************************************************
" Swap and backup file options
"*******************************************************************************

set directory=$HOME/.vim-directory// " Move swap files out of the editing folder.
set nobackup                         " No backup mechanism...
set nowritebackup                    " ...what so ever





"*******************************************************************************
" External changes tracking
"*******************************************************************************

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





"*******************************************************************************
" Plugins area
"*******************************************************************************

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



" ~~~~~~~~~~~~~~~~~~~~~~~~ Plugins declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Text objects
Plug 'kana/vim-textobj-user' " Create your own text objects (needed by some text object)
Plug 'kana/vim-textobj-entire' " For the entire buffer  (ae, ie (ignore leading/trailing empty lines))
Plug 'kana/vim-textobj-line' " for current line (al, il)
Plug 'michaeljsmith/vim-indent-object' " (ai, ii)
Plug 'whatyouhide/vim-textobj-xmlattr' " for XML/HTML attributes (ax and ix)


" Language support/syntax highlighting
Plug 'vim-scripts/matchit.zip'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'suan/vim-instant-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'xojs/vim-xo'
Plug 'jimmyhchan/dustjs.vim'


" Buffer management
Plug 'vim-scripts/BufOnly.vim'
Plug 'arithran/vim-delete-hidden-buffers'


" Extensions
Plug 'junegunn/goyo.vim' " Distraction-free writing.
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'shime/vim-livedown'
" After :PlugInstall, Go to '~/dotfiles/.vim/plugged/tern_for_vim' folder and type 'npm install'
Plug 'ternjs/tern_for_vim'
Plug 'junegunn/limelight.vim'
Plug '~/.fzf' " Should have been installed with git seperately in home folder.
Plug 'junegunn/fzf.vim'


" UI/UX
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim' " Hyperfocus-writing.





" Initialize plugin system
call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~ END : Plugins declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~





" ~~~~~~~~~~~~~~~~~~~~~~~~~ Plugins configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 25


" ternjs settings
autocmd CompleteDone * pclose " This will automatically hide the preview window whenever you're done auto-completing.


" vim-livedown settings
let g:livedown_port = 4242        " the port on which Livedown server will run
let g:livedown_browser = "safari" " the browser to use
let g:vim_markdown_no_default_key_mappings = 1


" vim-instant-markdown settings
let g:instant_markdown_autostart = 1


" ack.vim settings
let g:ackhighlight = 1


" emmet-vim settings
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-E>'
autocmd FileType html,hbs,scss,css,mustache,javascript EmmetInstall


" vim-easy-align settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-javascript settings
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

" vim-airline settings

" Help : 
" | A | B |       C       X | Y | Z |  [...] |
" A => mode, B => VCS, C => filename + read-only flag
" X => filetype, Y: file encoding[fileformat]
" Z => current position in the file 
"
" Z example: 10% ☰ 10/100 ln : 20
"
" 10%     - 10 percent down the top of the file
" ☰ 10    - current line 10
" /100 ln - of 100 lines
" : 20    - current column 20
let g:airline_powerline_fonts = 1 " automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


" vim-syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['xo']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" editorconfig-vim settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" fzf settings
"
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" limelight.vim settings
let g:limelight_conceal_ctermfg = 'darkgray'


" ~~~~~~~~~~~~~~~~~~~~~~~ END : Plugins configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~





"*******************************************************************************
" Key mappings
"*******************************************************************************

" Space as a Leader.
let mapleader = "\<Space>"

" Disable arrow keys...
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
" ...resize splits instead.
nnoremap <right> :vertical resize +2<CR>
nnoremap <left>  :vertical resize -2<CR>
nnoremap <down>  :resize -2<CR>
nnoremap <up>    :resize +2<CR>
nnoremap <S-right> :vertical resize +10<CR>
nnoremap <S-left>  :vertical resize -10<CR>
nnoremap <S-down>  :resize -10<CR>
nnoremap <S-up>    :resize +10<CR>

" Edit/Grep .vimrc / source .vimrc.
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>gv :e $MYVIMRC<CR>:BLines<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Search text/pattern across opened project.
nnoremap <leader>f :Ack! "

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" src: https://rietta.com/blog/hide-gitignored-files-fzf-vim/
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" Improve buffer switching
nnoremap <silent> gb :Buffers<CR>
" Improve buffer switching
nnoremap <silent> gl :BLines<CR>

" Toggle `hlsearch` with <Space>/
nnoremap <Leader>/ :set hlsearch!<CR>

" Close location list
nmap <leader>c :lclose<CR>



" Add space before/after cursor in normal mode
nnoremap [s i<Space><Esc>l
nnoremap ]s a<Space><Esc>h


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
nmap ]q :cn<CR>zz
nmap [q :cN<CR>zz

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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>





"*******************************************************************************
" Custom Commands
"*******************************************************************************

" JSON format
com! FormatJSON %!python -m json.tool
