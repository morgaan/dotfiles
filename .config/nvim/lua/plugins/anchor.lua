-- Harpoon for Oil <3
-- https://github.com/Sparkylc2/anchor.nvim
return {
	"Sparkylc2/anchor.nvim",
	dependencies = { "stevearc/oil.nvim" },
	opts = {
		keys = {
			add = "<leader>a",
			menu = "<C-e>",
			nav_prefix = "<leader>",
		},
		max_slots = 9,
	}
}
