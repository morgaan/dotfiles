-- Focused files manager/switcher
return {
	'ThePrimeagen/harpoon',
	event = 'VeryLazy',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
		local keymap = vim.keymap.set
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		keymap('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon: [A]dd file' })
		keymap('n', '<leader>hm', ui.toggle_quick_menu, { desc = '[H]arpoon [M]enu' })
		-- Telescope integration
		keymap('n', '<leader>ht', require('telescope').extensions.harpoon.marks, { desc = 'Harpoon: [H]arpoon marks in [T]elescope' })

		keymap('n', '<leader>1', function() ui.nav_file(1) end, { desc = 'Harpoon: Navigate to file 1' })
		keymap('n', '<leader>2', function() ui.nav_file(2) end, { desc = 'Harpoon: Navigate to file 2' })
		keymap('n', '<leader>3', function() ui.nav_file(3) end, { desc = 'Harpoon: Navigate to file 3' })
		keymap('n', '<leader>4', function() ui.nav_file(4) end, { desc = 'Harpoon: Navigate to file 4' })

		-- Previous/Next (mnemonic G preceeds H and J follows H on my keyboard)
		keymap('n', '<leader>hg', ui.nav_prev, { desc = '[H]arpoon: Nav previous' })
		keymap('n', '<leader>hj', ui.nav_next, { desc = '[H]arpoon: Nav next' })
		-- Below should read `number` + `<leader>` + `h` (e.g. 2]h will
		-- switch to 2nd buffer in Harpoon marks
		-- keymap('n', '<leader>hh', function() ui.nav_file(vim.v.count1) end, { desc = 'Harpoon: Navigate to file i(where is the count preceding the key mapping' })

	end
}
