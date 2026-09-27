-- Quick insertion of log statements for the variable under the cursor (normal
-- mode) or the selection (visual mode).
--
-- https://github.com/chrisgrieser/nvim-chainsaw
return {
	"chrisgrieser/nvim-chainsaw",
	event = "VeryLazy",
	opts = {}, -- required even if left empty
	config = function()
		local chainsaw = require("chainsaw")

		chainsaw.setup({})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>vl",
			chainsaw.variableLog,
			{ desc = "Insert log statement for variable under the cursor" }
		)
	end,
}
