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

vim.cmd('colorscheme solarized')
vim.o.background = 'dark'
