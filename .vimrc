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
set nojoinspaces               " No extra spaces when joining lines



"*******************************************************************************
" UI options
"*******************************************************************************

set title                                   " Show file title in terminal tab.
set laststatus=2                            " Always show status line.
set splitright                              " Open splits to the right...
set splitbelow                              " ... or below.
set listchars=tab:▸\ ,space:·,trail:·,eol:¬ " Characters for invisibles (set list).
set number                                  " ...but absolute numbers on the current line (hybrid numbering).
set cursorline                              " Highlight current line.
autocmd FileType gitcommit set textwidth=72 " However, in Git commit messages, let's make it 72 characters.
set colorcolumn=+1                          " Colour the 81st (or 73rd) column so that we don't type over our limit.
set termguicolors
colorscheme solarized8                      " Solarized8 colour scheme... improved Solarized that avoid shitty hight contrast for PMenu
set background=dark                         " ... with a dark background.
let g:solarized_diffmode="high"             " Set high visibility for diff mode.
set guifont=Victor\ Mono:h16
set scrolloff=3                              " Don't like my cursor line getting too close to the top or the bottom of the screen

" More contrasted hightlight of current line.
autocmd ColorScheme * hi CursorLineNr ctermbg=magenta ctermfg=white guibg=magenta guifg=white
" More contrasted hightlight of current cursor.
autocmd ColorScheme * hi Cursor ctermbg=yellow ctermfg=black guibg=yellow guifg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" More contrasted colorcolumn (for line breaks)
autocmd ColorScheme * hi ColorColumn ctermbg=darkgrey guibg=#073642

set wildmenu " Show file options above the command line.

" Don't offer to open certain files/directories.
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.map,*.min.css,*.min.css
set wildignore+=*/node_modules/*,*/bower_components/*

" Automatically equalize splits when Vim is resized.
autocmd VimResized * wincmd =

" Status line (inspired from " https://github.com/junegunn/dotfiles/blob/master/vimrc)
function! s:statusline_expr()

  let winNumber = '[w%{winnr()}|b%n]'
  let currentFile = '%f%'
  let isModified = "<%{&modified ? '[Unsaved] ' : !&modifiable ? '[RO] ' : '[Saved]'}"
  let gitBranch = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let seperator = ' %= '
  let fileType  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let cursorPosition = '%-12(%l:%c%V%)'
  let percentageThrough = '|%P'
  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  let cocStatus = "%{coc#status()}%{get(b:,'coc_current_function','')}"

  return winNumber.currentFile.isModified.gitBranch.seperator.fileType.cursorPosition.percentageThrough.seperator.cocStatus
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
set noexpandtab    " Use tabs.
set tabstop=4    " Existing tabs are visually rendered as 4 columns.
set shiftwidth=4 " Indent by 4 columns.
set softtabstop=4 " Indent by 4 columns.
set shiftround   " Round indent to nearest multiple of set shiftwidth.




"*******************************************************************************
" Text rendering options
"*******************************************************************************

set showmatch                              " Show matching parens, brackets, etc.
syntax enable                              " Enable syntax highlighting.
" Italicised comments...
highlight Comment cterm=italic gui=italic guifg=#5f87df
" ... and attributes
highlight htmlArg cterm=italic gui=italic guifg=#af8700

" Ensure that italics carry over if I ever switch light/dark scheme
autocmd ColorScheme * highlight! Comment cterm=italic gui=italic
autocmd ColorScheme * highlight! htmlArg cterm=italic gui=italic

" Omni completion is not usually enabled by default. These 2 lines turn it on.
filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd FileType markdown syntax sync fromstart   " Force a full file syntax computation when opening Markdown files.
" autocmd FileType dustjs set textwidth=0           " Disable textwidth for dust template

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

autocmd BufNewFile,BufRead *.md set filetype=markdown         " Markdown also starts with .md
autocmd BufNewFile,BufRead *.md setlocal textwidth=80         " Force the cursor onto a new line after 80 characters.
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
" Enter vim routine
"*******************************************************************************

function MyVimEnter()
    if argc() == 1 && argv(0) == '.'
      execute "Files"
    endif

    return
endfunction
" The 'nested' before call allows nested autocmds, important for
" syntax detection etc.
autocmd VimEnter * nested call MyVimEnter()






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
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Syntax checkers/linters
Plug 'editorconfig/editorconfig-vim'


" Buffer management
Plug 'arithran/vim-delete-hidden-buffers' " Clear any unused buffers that are hidden.
Plug 'tpope/vim-eunuch' " Vim sugar for the UNIX shell commands that need it the most.


" UI/UX Extensions
Plug 'junegunn/goyo.vim', {
      \ 'for': ['md', 'markdown']
      \ }                                         " Distraction-free writing.
Plug '~/.fzf'                                     " Should have been installed with git seperately in home folder.
Plug 'junegunn/fzf.vim'                           " Fuzzy search finder.
Plug 'junegunn/limelight.vim'                     " Hyperfocus-writing.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  } " Preview markdown as you type
Plug 'airblade/vim-gitgutter'                     " Shows a +/-/~ next to lines that have been added...
Plug 'mileszs/ack.vim'                            " Ack command for vim
Plug 'mattn/emmet-vim'                            " Greatly improves HTML & CSS workflow
Plug 'tpope/vim-fugitive'                         " A Git wrapper so awesome, it should be illegal

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


" CoC settings

" Not sure this is working, but leave it here for reference.
" Implemented coc extensions:
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-json', 
  \ 'coc-prettier', 
  \ ]
" hi CocFloating ctermbg=8

" ### From README subtracted from the one already set elsewhere

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>,  <Plug>(coc-format-selected)
nmap <leader>,  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" markdown-preview settings
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" ack.vim settings
let g:ackhighlight = 1


" emmet-vim settings
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-E>'
autocmd FileType html,hbs,liquid,njk,dust,scss,css,mustache,javascript EmmetInstall


" vim-easy-align settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-javascript settings
let g:javascript_plugin_jsdoc=1


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
" Delete buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction
function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
command! DeleteBuffers call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

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
nnoremap <leader>ev :tabnew ~/.vimrc<CR>
nnoremap <leader>gv :tabnew ~/.vimrc<CR>:BLines<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" src: https://rietta.com/blog/hide-gitignored-files-fzf-vim/
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <silent> <C-p> :Files<CR>
" Fuzzy search for buffers. Improve buffer switching.
nnoremap <silent> gb :Buffers<CR>
" Fuzzy search for line in current buffer.
nnoremap <silent> gl :BLines<CR>

" Search text/pattern across opened project.
nnoremap <leader>f :Ack! "

" Close location list.
nmap <leader>c :lclose<CR>
" Close quickfix window.
nmap <leader>qf :cclose<CR>




" Turn off `hlsearch` with <Space>/ until next search
" nnoremap <Leader>/ :silent! nohls<cr>
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup SearchHighlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end





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
nmap <leader>d :bw<cr>
" Easier quit.
nnoremap <leader>q :q<cr>
" Easier window navigation.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ease help browsing by adding Find next/previous subject
autocmd! FileType help nnoremap <silent> <buffer> <Tab> /\|\zs\S\+\ze\|<CR>:set nohlsearch<CR>
autocmd! FileType help nnoremap <silent> <buffer> <S-Tab> ?\|\zs\S\+\ze\|<CR>:set nohlsearch<CR>

" Create file when if it does not exist for scss files
autocmd! FileType scss nnoremap <silent> <buffer> <leader>gf :exe 'e '.expand('%:h').'/_'.expand('<cfile>').'.scss'<CR>

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
" Resetting winfixwidth make <C-W> = works again!
nnoremap <silent> -- :Lex %:p:h<CR>:set winfixwidth!<CR>

" Faster toggle Goyo + Limelight
nnoremap <leader><Esc> :Goyo<bar>Limelight!!<CR>

" Toggle conceallevel (useful to toggle for URL on vimwiki files)
nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" Forgiving :Qall to :qall
cmap Qa qa

inoremap if( if (





"*******************************************************************************
" Other stuffs
"*******************************************************************************

" Vertically center the buffer when entering insert mode.
autocmd InsertEnter * norm zz
