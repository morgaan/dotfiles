local opt = vim.opt
local winopt = vim.wo

-- General configuration
-- ---------------------

opt.encoding = 'utf-8'
opt.mouse = ''

-- Indentation
-- -----------

opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true

-- Search
-- ------

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Swap and backup file strategy
-- -----------------------------

opt.directory = os.getenv("HOME") .. "/.vim-directory//"
opt.undodir = os.getenv("HOME") .. "/.vim-directory/undo//"
opt.undofile = true
opt.backup = false
opt.writebackup = false

-- User Interface
-- --------------

opt.termguicolors = true
opt.title = true
opt.number = true
opt.splitright = true
opt.splitbelow = true
opt.listchars = 'tab:>~,space:·,trail:·,eol:¬'
opt.cursorline = true
opt.textwidth = 80
opt.guifont = {'Victor Mono', 'h16'}
opt.showmatch = true
opt.omnifunc = 'syntaxcomplete#Complete'
opt.guicursor = 'n-v-c-ci-i:block-Cursor-blinkwait1-blinkon150-blinkoff150'
opt.background = 'dark'
opt.conceallevel = 2
winopt.colorcolumn = '+1'
winopt.signcolumn = 'yes'

-- Don't offer to open certain files/folders
opt.wildignore:append{"*.bmp", "*.gif", "*.ico", "*.jpg", "*.png", "*.ico"}
opt.wildignore:append{"*.pdf", "*.psd"}
opt.wildignore:append{"*.map", "*.min.css", "*.min.css"}
opt.wildignore:append{"node_modules", "bower_components"}

-- Outside vim file changes tracking
opt.updatetime = 250

-- Better completion experience
opt.completeopt = 'menuone,noselect'

