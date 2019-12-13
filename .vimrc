"*******************************************************************************
" General configuration options
"*******************************************************************************

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




"*******************************************************************************
" UI options
"*******************************************************************************

set title                                   " Show file title in terminal tab.
set laststatus=2                            " Always show status line.
set splitright                              " Open splits to the right...
set splitbelow                              " ... or below.
set listchars=tab:▸\ ,trail:·,eol:¬         " Characters for invisibles (set list).
set number                                  " ...but absolute numbers on the current line (hybrid numbering).
set cursorline                              " Highlight current line.
set textwidth=80                            " Force the cursor onto a new line after 80 characters.
autocmd FileType gitcommit set textwidth=72 " However, in Git commit messages, let's make it 72 characters.
set colorcolumn=+1                          " Colour the 81st (or 73rd) column so that we don't type over our limit.
colorscheme solarized                       " Solarized colour scheme...
set background=dark                         " ... with a dark background.
set t_Co=256                                " 256 colours please.
let g:solarized_diffmode="high"             " Set high visibility for diff mode.
set guifont=Victor\ Mono:h16

set wildmenu " Show file options above the command line.

" Don't offer to open certain files/directories.
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css,*.min.css
set wildignore+=*/node_modules/*,*/bower_components/*

" Automatically equalize splits when Vim is resized.
autocmd VimResized * wincmd =

" Set relative number just for normal mode.
"augroup toggle_relative_number
"autocmd InsertEnter * :setlocal relativenumber
"autocmd InsertLeave * :setlocal norelativenumber

" Status line (inspired from " https://github.com/junegunn/dotfiles/blob/master/vimrc)
function! s:statusline_expr()
  let isModified = "%{&modified ? '[Unsaved] ' : !&modifiable ? '[ReadOnly] ' : '[NoChanges] '}"
  let gitBranch = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let seperator = ' %= '
  let fileType  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let cursorPosition = '%-12(%l:%c%V%)'
  let percentageThrough = '|%P'

  return '[b%n] %F%<'.isModified.gitBranch.seperator.fileType.cursorPosition.percentageThrough
endfunction
let &statusline = s:statusline_expr()


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

autocmd FileType markdown syntax sync fromstart   " Force a full file syntax computation when opening Markdown files.
" autocmd FileType dustjs set textwidth=0           " Disable textwidth for dust template

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

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
Plug 'kana/vim-textobj-user'           " Create your own text objects (needed by some text object)
Plug 'kana/vim-textobj-entire'         " For the entire buffer  (ae, ie (ignore leading/trailing empty lines))
Plug 'kana/vim-textobj-line'           " for current line (al, il)
Plug 'michaeljsmith/vim-indent-object' " current indentation (ai, ii)
Plug 'whatyouhide/vim-textobj-xmlattr' " for XML/HTML attributes (ax and ix)
Plug 'jceb/vim-textobj-uri' " Text objects for dealing with URIs (au and iu)
Plug 'wellle/targets.vim'              " Add seperators like ,.;:+-=~_*#/|\&$ and much more (https://www.barbarianmeetscoding.com/blog/2019/08/11/exploring-vim-plugins-improve-and-extend-your-text-objects-with-targets-vim)


" Language support/syntax highlighting
Plug 'mustache/vim-mustache-handlebars', { 'for': ['mustache', 'hbs'] }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'jimmyhchan/dustjs.vim', { 'for': 'dust' }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Syntax checkers/linters
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'xojs/vim-xo'


" Buffer management
Plug 'arithran/vim-delete-hidden-buffers' " Clear any unused buffers that are hidden.


" UI/UX Extensions
Plug 'junegunn/goyo.vim', {
      \ 'for': ['md', 'markdown']
      \ }                                         " Distraction-free writing.
Plug '~/.fzf'                                     " Should have been installed with git seperately in home folder.
Plug 'junegunn/fzf.vim'                           " Fuzzy search finder.
Plug 'junegunn/limelight.vim'                     " Hyperfocus-writing.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } " Preview markdown as you type
Plug 'airblade/vim-gitgutter'                     " Shows a +/-/~ next to lines that have been added...
Plug 'ternjs/tern_for_vim', {
      \ 'do': 'npm install',
      \ 'for': ['js', 'jsx']
      \ }                                         " When using <C-x><C-o> bring dropdown with autocompletation for JS.
Plug 'mileszs/ack.vim'                            " Ack command for vim
Plug 'mattn/emmet-vim'                            " Greatly improves HTML & CSS workflow
Plug 'tpope/vim-fugitive'                         " A Git wrapper so awesome, it should be illegal
Plug 'takac/vim-hardtime'                         " Vim HardTime

" Extensions
Plug 'vim-scripts/matchit.zip'         " Extends `%` operator.
Plug 'christoomey/vim-sort-motion'     " Ability to sort using text objects and motions (gsip, gsii, gsi(...).
Plug 'tpope/vim-commentary'            " Comment stuff out (gcc for a line, gc with motion e.g. gcap).
Plug 'tpope/vim-surround'              " quoting/parenthesizing made simple (e.g. ysaw', cs'`).
Plug 'tpope/vim-unimpaired'            " Pairs of handy bracket mappings.
Plug 'tpope/vim-repeat'                " Enable repeating supported plugin maps with `.`
Plug 'vim-scripts/ReplaceWithRegister' " (e.g. grap+)
Plug 'junegunn/vim-easy-align'         " Simple, easy-to-use Vim alignment plugin.


" Applications
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'





" Initialize plugin system
call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~ END : Plugins declaration ~~~~~~~~~~~~~~~~~~~~~~~~~~~





" ~~~~~~~~~~~~~~~~~~~~~~~~~ Plugins configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_winsize = 25


" ternjs settings
" This will automatically hide the preview window whenever you're done auto-completing.
autocmd CompleteDone * pclose


" markdown-preview settings
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

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
let g:javascript_plugin_jsdoc=1


" vim-syntastic settings and hacks
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 " Plays well with vimwikisearch https://github.com/vimwiki/vimwiki/issues/350#issuecomment-303508835
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['xo']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_javascript_checkers = ['xo']
let g:syntastic_ignore_files = ['\c\.scala\.html$']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" Close error window not only on :quit but also on :bdelete.
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

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
let g:fzf_layout = { 'up': '~50%' }


" limelight.vim settings
let g:limelight_conceal_ctermfg = 'darkgray'

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['javascript', 'bash']
let g:vim_markdown_frontmatter = 1


" vimwiki settings
let g:vimwiki_list = [{'path': '~/notebook/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0  " Fix this https://github.com/vimwiki/vimwiki/issues/95
nmap <Leader>wb :VimwikiGoBackLink<CR>

" calendar-vim settings
let g:calendar_diary='~/notebook/diary'

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 1000
let g:hardtime_ignore_quickfix = 1

" ~~~~~~~~~~~~~~~~~~~~~~~ END : Plugins configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~





"*******************************************************************************
" Key mappings
"*******************************************************************************

" Space as a Leader.
let mapleader = "\<Space>"

" Disable arrow keys...
" map  <up>    <nop>
" imap <up>    <nop>
" map  <down>  <nop>
" imap <down>  <nop>
" map  <left>  <nop>
" imap <left>  <nop>
" map  <right> <nop>
" imap <right> <nop>
nnoremap <S-right> :vertical resize +2<CR>
nnoremap <S-left>  :vertical resize -2<CR>
nnoremap <S-down>  :resize -2<CR>
nnoremap <S-up>    :resize +2<CR>

" Move by visual lines rather than by lines
nnoremap j gj
nnoremap k gk

" Edit/Grep .vimrc / source .vimrc.
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>gv :e $MYVIMRC<CR>:BLines<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" src: https://rietta.com/blog/hide-gitignored-files-fzf-vim/
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" Fuzzy search for buffers. Improve buffer switching.
nnoremap <silent> gb :Buffers<CR>
" Fuzzy search for line in current buffer.
nnoremap <silent> gl :BLines<CR>
" Fuzzy search for projects tags. (Overrides Go to next tab, but I do not use it)
nnoremap <silent> gt :Tags<CR>

" Search text/pattern across opened project.
nnoremap <leader>f :Ack! "

" Close location list.
nmap <leader>c :lclose<CR>
" Close quickfix window.
nmap <leader>qf :cclose<CR>

" Toggle `hlsearch` with <Space>/
nnoremap <Leader>/ :set hlsearch!<CR>

" Toggle `relativenumber` with <Space>n
nnoremap <Leader>n :set relativenumber!<CR>

" Add space before/after cursor in normal mode
nnoremap [s i<Space><Esc>l
nnoremap ]s a<Space><Esc>h

" Lines swapped get indent
function! UnimpairedMove(direction)
  execute "norm \<Plug>unimpairedMove" . a:direction
  norm! ==
endfunction
nmap ]e :call UnimpairedMove('Down')<CR>
nmap [e :call UnimpairedMove('Up')<CR>

" Add explicit tab in insert mode
inoremap <Leader><Tab> <C-V><Tab>

" Make `n`/`N` bring next search result to middle line
nnoremap n nzz
nnoremap N Nzz
" `G` skips to bottom of file and places line in middle of screen
" nnoremap G :norm! Gzz<CR>
" nnoremap G :norm! Gzz<CR>
" Jump Up / Jump down and places line in middle of screen
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-b> <C-b>zt
nmap ]q :cn<CR>zz
nmap [q :cN<CR>zz

" search for the selected text
vnoremap // y/\V<C-R>"<CR>
" search for the selected text within CWD
vnoremap <C-f> y:Ack! "<C-R>"" --
" execute the selected text
vnoremap <leader>e y:<C-R>"<CR>

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Easier write.
nmap <leader>w :w!<cr>
" Easier delete buffer.
nmap <leader>d :bd<cr>
" Easier quit.
nnoremap <leader>q :q<cr>
" Easier window navigation.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ease help browsing by adding Find next/previous subject
nnoremap <buffer> <Tab> /\|\zs\S\+\ze\|<CR>:set nohlsearch<CR>
nnoremap <buffer> <S-Tab> ?\|\zs\S\+\ze\|<CR>:set nohlsearch<CR>

" Close all hidden/all buffers.
nnoremap <leader>dhb :DeleteHiddenBuffers<CR>
nnoremap <leader>dab :%bd<CR>

" Swap booleans.
nnoremap <leader>1 :s/false/true/<CR>
nnoremap <leader>0 :s/true/false/<CR>

" Shortcut to rapidly toggle `set list`.
nmap <leader>l :set list!<CR>

" Copy current file path to clipboard.
nnoremap gcp :let @+=@%<CR>

" Faster open file explorer (netrw).
nnoremap <silent> <leader>e :Lex<CR>

" Open folder container active buffer in file explorer (netrw).
nnoremap <silent> -- :Lex %:p:h<CR>

" Faster toggle Goyo + Limelight
nnoremap <leader><Esc> :Goyo<bar>Limelight!!<CR>

" Toggle conceallevel (useful to toggle for URL on vimwiki files)
nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>
