-- Improved UI and workflow for the Neovim quickfix list. By same author of
-- oil.nvim <3
--
-- https://github.com/stevearc/quicker.nvim
return {
	'stevearc/quicker.nvim',
	ft = "qf",
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {},
	keys = {
		{
			">",
			function()
				require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
			end,
			desc = "Expand quickfix context",
		},
		{
			"<",
			function()
				require("quicker").collapse()
			end,
			desc = "Collapse quickfix context",
		},
	},
}
