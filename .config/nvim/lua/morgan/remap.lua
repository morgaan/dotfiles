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

vim.keymap.set('n', '<leader>gs', '<cmd>Ge :<CR>')
