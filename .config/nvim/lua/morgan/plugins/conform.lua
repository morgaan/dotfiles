-- =============================================================================
-- TITLE : conform.nvim
-- ABOUT : Lightweight yet powerful formatter plugin for Neovim
-- LINKS :
--   > github:     https://github.com/stevearc/conform.nvim
--   > tutorial:   https://www.josean.com/posts/neovim-linting-and-formatting
-- FORMATTERS :
--   > prettier:   https://prettier.io
--   > stylua:     https://github.com/JohnnyMorganz/StyLua
-- =============================================================================

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				scss = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				-- yaml = { "prettier" },
				markdown = { "prettier", "markdownlint-cli2" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
