-- General configuration
-- ---------------------

vim.api.nvim_exec('language en_US.utf-8', true)
vim.o.encoding = 'utf-8'
vim.o.backspace = 'indent,eol,start'
vim.o.hidden = true
vim.o.history = 1000
vim.o.exrc = true

-- Indentation
-- -----------


-- Search
-- ------


-- Swap and backup file strategy
-- -----------------------------


-- User Interface
-- --------------

vim.o.termguicolors = true
vim.o.title = true
vim.o.laststatus = 2
vim.o.number = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.listchars = 'tab:>~,space:·,trail:·,eol:¬'
vim.o.cursorline = true
vim.cmd('set colorcolumn=+1')
vim.opt.guifont = {'Victor Mono', 'h16'}
vim.o.showmatch = true
vim.o.omnifunc = 'syntaxcomplete#Complete'
vim.o.guicursor = 'n-v-c-ci-i:block-Cursor-blinkwait1-blinkon150-blinkoff150'

vim.cmd('colorscheme solarized')
vim.o.background = 'dark'
