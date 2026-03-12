return {
	'stevearc/oil.nvim',
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
			natural_order = false
		},
		keymaps = {
			['<C-p>'] = false, -- avoid override of Telescope search keymap.
			['<leader>p'] = 'actions.preview' -- replace by leader p
		}
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
