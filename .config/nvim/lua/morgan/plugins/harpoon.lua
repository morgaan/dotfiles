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
		keymap('n', '[h', ui.nav_prev, { desc = '[H]arpoon: Nav previous' })
		keymap('n', ']h', ui.nav_next, { desc = '[H]arpoon: Nav next' })
		-- Below should read `number` + `<leader>` + `h` (e.g. 2]h will
		-- switch to 2nd buffer in Harpoon marks
		keymap('n', ']h', function() ui.nav_file(vim.v.count1) end, { desc = 'Harpoon: Navigate to file i(where is the count preceding the key mapping' })

		-- Telescope integration
		keymap('n', '<leader>ht', require('telescope').extensions.harpoon.marks, { desc = 'Harpoon: [H]arpoon marks in [T]elescope' })
	end
}
