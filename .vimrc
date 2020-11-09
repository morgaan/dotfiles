" VARIABLES
" =========

" Plugins variables
" -----------------

let g:netrw_banner = 0
let g:netrw_liststyle = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 0
 
" vim-javascript
let g:javascript_plugin_jsdoc=1

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ack.vim
let g:ackhighlight = 1

" fzf
let g:fzf_layout = { 'up': '~50%' }

" CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-json', 
  \ 'coc-prettier', 
  \ ]

" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" emmet-vim
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 0

" vimwiki
let g:vimwiki_list = [{'path': '~/notebook/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0


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

Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['mustache', 'hbs'] }
Plug 'jimmyhchan/dustjs.vim', { 'for': 'dust' }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

" Syntax checkers/linters
" -----------------------

Plug 'editorconfig/editorconfig-vim'

" Buffer management
" -----------------

Plug 'arithran/vim-delete-hidden-buffers'
Plug 'tpope/vim-eunuch'

" UI/UX Extensions
" ----------------

Plug '~/.fzf' " Should have been installed with git seperately in home folder.
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plugin 'christoomey/vim-tmux-navigator'

" Extensions
" ----------

Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-easy-align'

" Applications
" ------------

Plug 'vimwiki/vimwiki'

call plug#end()





" FUNCTIONS
" =========

function MyVimEnter()
    if argc() == 1 && argv(0) == '.'
      execute "Files"
    endif

    return
endfunction

" fzf functions
" -------------

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" CoC functions
" -------------

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction





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
set showmatch
syntax enable

" Turn on omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Cursor behaviour
set guicursor=n-v-c-ci-i:block-Cursor-blinkwait1-blinkon150-blinkoff150

" Don't offer to open certain files/folders
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css,*.min.css
set wildignore+=*/node_modules/*,*/bower_components/*

" Outside vim file changes tracking
set updatetime=250
set autoread 


" Indentation
" -----------

set autoindent
filetype plugin indent on

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround


" Search
" ------

set incsearch 
set hlsearch
set ignorecase
set smartcase


" Swap and backup file strategy
" -----------------------------

set directory=$HOME/.vim-directory//
set nobackup
set nowritebackup





" HIGHLIGHTS
" ==========

" Italicised comments and attributes.
highlight Comment cterm=italic gui=italic guifg=#5f87df
highlight htmlArg cterm=italic gui=italic guifg=#af8700

highlight StatuslineFilename cterm=bold ctermfg=136 gui=bold guifg=#b58900
highlight StatuslineCustom ctermfg=252 ctermbg=238 guifg=#D9D9D9 guibg=#565656





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

nnoremap <leader>w :write!<cr>
nnoremap <leader>q :quit<cr>

" Easier window navigation.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easilly search for things.
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> gb :Buffers<CR>
nnoremap <silent> gl :BLines<CR>
nnoremap <leader>f :Ack! "
vnoremap <leader>f y:Ack! "<C-R>"" --
vnoremap <leader>/ y/\V\<<C-R>"\><CR>
vnoremap <leader>? y?\V\<<C-R>"\><CR>

" Swap booleans.
nnoremap <leader>1 :s/false/true/<CR>
nnoremap <leader>0 :s/true/false/<CR>

nnoremap gcp :let @+=@%<CR>

nmap <leader>l :set list!<CR>
nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" Copy current file path to clipboard.
nnoremap gcp :let @+=@%<CR>

" Open active buffer's folder in netrw.
nnoremap <silent> -- :Lex %:p:h<CR>:set winfixwidth!<CR>

nnoremap [s i<Space><Esc>l
nnoremap ]s a<Space><Esc>h

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nmap ]q :cn<CR>zz
nmap [q :cN<CR>zz

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Forgiving mappings
" ------------------
cmap Qa qa
cmap Wq wq


" CoC mappings
" ------------

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Personally used for local scope symbol renaming.
nmap <leader>ln <Plug>(coc-rename)
" Project wide rename of current symbol.
nnoremap <leader>pr :CocSearch <C-R>=expand('<cword>')<CR><CR>

" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)


" vim-easy-align mappings
" -----------------------

" Interactive mode
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vimwiki mappings
nmap <Leader>wb :VimwikiGoBackLink<CR>




" AUTOCOMMANDS
" ============

autocmd VimEnter * nested call MyVimEnter()

" Outside vim file changes tracking
autocmd CursorHold,CursorHoldI * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

autocmd ColorScheme * highlight CursorLineNr ctermbg=magenta ctermfg=white guibg=magenta guifg=white
autocmd ColorScheme * highlight Cursor ctermbg=yellow ctermfg=black guibg=yellow guifg=black
autocmd ColorScheme * highlight ColorColumn ctermbg=darkgrey guibg=#073642

autocmd VimResized * wincmd =

autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead *.md setlocal textwidth=80

" emmet-vim
autocmd FileType html,hbs,css,scss EmmetInstall





" COMMANDS
" ========

" fzf commands
" ------------

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! Folders call fzf#run(fzf#wrap({'source': 'find * -type d \( ! -path "node_modules/*" \)'}))

command! NodeModules call fzf#run(fzf#wrap({'source': 'find node_modules/* -type d'}))

command! DeleteBuffers call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))





" STATUSLINE
" ==========
 
" Preview
" -------------------------------------------------
" W1・<vim>       master・☰ 98%・362,1  .vimrc [+]
" -------------------------------------------------
set statusline=%#StatuslineCustom#
set statusline+=\ W%{winnr()}・
set statusline+=%{len(&filetype)?'<'.&filetype.'>':''}
set statusline+=%=
set statusline+=%{exists('g:loaded_fugitive')&&len(FugitiveHead())?'\ '.FugitiveHead():''}
set statusline+=・☰\ 
set statusline+=%P・
set statusline+=%l,
set statusline+=%c
set statusline+=\ 
set statusline+=%#StatuslineFilename#
set statusline+=\ %t\ 
set statusline+=%#ErrorMsg#%m 
