-- Focused files manager/switcher
return {
	'ThePrimeagen/harpoon',
	event = 'VeryLazy',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
		local keymap = vim.keymap.set
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		keymap('n', '<leader>a', mark.add_file, { desc = 'Harpoon: [A]dd file' })
		keymap('n', '<leader><leader>h', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle quick menu' })
		keymap('n', '<leader><leader>', function() ui.nav_file(vim.v.count1) end, { desc = 'Harpoon: Navigate to file i(where is the count preceding the key mapping' })

		-- Telescope integration
		keymap('n', '<leader>hm', require('telescope').extensions.harpoon.marks, { desc = 'Harpoon: [H]arpoon [M]arks' })
	end
}
