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
		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				-- FormatToggle! will toggle formatting just for this buffer
				if not vim.b.disable_autoformat then
					vim.b.disable_autoformat = true
					vim.notify("Format on save OFF for this buffer")
				else
					vim.b.disable_autoformat = false
					vim.notify("Format on save ON for this buffer")
				end
			else
				if not vim.g.disable_autoformat then
					vim.g.disable_autoformat = true
					vim.notify("Format on save OFF")
				else
					vim.g.disable_autoformat = false
					vim.notify("Format on save ON")
				end
			end
		end, {
				desc = "Toggle autoformat-on-save",
				bang = true,
			})

		local conform = require("conform")
		local opts = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 3000,
		};

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
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return opts
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format(opts)
		end, { desc = "Format file or range (in visual mode)" })

		vim.keymap.set({ "n" }, "<M-f>", '<cmd>FormatToggle<CR>', { desc = "Toggle Conform format on save" })
	end,
}
