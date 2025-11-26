local opt = vim.opt
local winopt = vim.wo

-- General configuration
-- ---------------------

opt.encoding = 'utf-8'
opt.mouse = ''
opt.iskeyword:append("-") -- Treat dash as part of a word

-- Spell check
opt.spelllang = {'en', 'fr', 'de'}
opt.spell = true

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
opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, Command-line
	"i-ci-ve:block", -- Insert, Command-line Insert, Visual-exclusive
	"r-cr:hor20", -- Replace, Command-line Replace
	"o:hor50", -- Operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}
opt.background = 'dark'
winopt.colorcolumn = '+1'
winopt.signcolumn = 'yes'

-- Don't offer to open certain files/folders
opt.wildignore:append{"*.bmp", "*.gif", "*.ico", "*.jpg", "*.png", "*.ico"}
opt.wildignore:append{"*.pdf", "*.psd"}
opt.wildignore:append{"*.map", "*.min.css", "*.min.css"}
opt.wildignore:append{"node_modules", "bower_components"}

-- File Handling
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't backup before overwriting
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.directory = os.getenv("HOME") .. "/.vim-directory//"
opt.updatetime = 250 -- Time in ms to trigger CursorHold
opt.timeoutlen = 500 -- Time in ms to wait for mapped sequence
opt.ttimeoutlen = 0 -- No wait for key code sequences
opt.autoread = true -- Auto-reload file if changed outside
-- Set undo directory and ensure it exists
local undodir = os.getenv("HOME") .. "/.vim-directory/undo//" -- Undo directory path
opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p") -- Create if not exists
end

-- Better completion experience
opt.completeopt = 'menuone,noselect'

