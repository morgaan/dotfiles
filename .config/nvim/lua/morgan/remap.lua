vim.g.mapleader = " "

vim.keymap.set('n', '--', vim.cmd.Ex)

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<leader>w', '<cmd>write!<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>')

-- Easier window navigation.
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- <S-arrow> to resize splits (not optimal yet).
vim.keymap.set('n', '<S-right>', '<cmd>vertical resize +2<CR>')
vim.keymap.set('n', '<S-left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<S-down>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<S-up>', '<cmd>resize +2<CR>')

vim.keymap.set('n', '<leader>gs', '<cmd>Ge :<CR>')

-- Swap booleans.
vim.keymap.set('n', '<leader>1', '<cmd>s/false/true/<CR>')
vim.keymap.set('n', '<leader>0', '<cmd>s/true/false/<CR>')

-- Copy current git branch to clipboard.
vim.keymap.set('n', '<leader>cb', '<cmd>!git cp<CR><CR>')

vim.keymap.set('n', '[s', 'i<Space><Esc>l')
vim.keymap.set('n', ']s', 'a<Space><Esc>h')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', ']q', '<cmd>cn<CR>zz', {remap = true})
vim.keymap.set('n', '[q', '<cmd>cN<CR>zz', {remap = true})
vim.keymap.set('n', '=ie', '=<Plug>(textobj-entire-i)``zz', {silent = true})
