local keymap = vim.keymap.set
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

keymap('n', '<leader>a', mark.add_file, { desc = 'Harpoon [A]dd file' })
keymap('n', '<leader><leader>h', ui.toggle_quick_menu, { desc = 'Harpoon Toggle quick menu' })
keymap('n', '<leader><leader>', function() ui.nav_file(vim.v.count1) end, { desc = 'Harpoon Navigate to file i(where is the count preceding the key mapping' })
