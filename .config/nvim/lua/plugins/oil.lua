return {
	'stevearc/oil.nvim',
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
			natural_order = false,
			is_hidden_file = function(name, bufnr)
				local is_dotfile = vim.startswith(name, ".") and name ~= ".."

				-- `.assets` directories are where I store notes attachments in
				-- my Obsidian Second Brain.
				local is_assets_dir = vim.endswith(name, ".assets")
				if is_assets_dir then
					return true
				end

				return is_dotfile
			end,
		},
		keymaps = {
			['<C-p>'] = false, -- avoid override of Telescope search keymap.
			['<leader>p'] = 'actions.preview' -- replace by leader p
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
