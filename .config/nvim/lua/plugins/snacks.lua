return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- use Snacks notifier to support noice.
		notifier = { enabled = true },

		-- for now all the rest disabled
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enable = false },
		picker = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
		{ "<leader>dn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show [M]essages [History] with Snacks notifier" },
	}
}
