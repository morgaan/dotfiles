local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', 'h<leader><leader>', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader><leader>', function() ui.nav_file(vim.v.count1) end)
