-- https://github.com/folke/zen-mode.nvim
-- Usage :ZenMode
return {
	{
		"folke/zen-mode.nvim",
		event = {'BufReadPre', 'BufNewFile'},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
			window = {
				options = {
				-- signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
				},
			},
			plugins = {
				gitsigns = { enabled = false }, -- disables git signs
			}
		}
	}
}
