return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
		-- Config defaults: https://github.com/folke/noice.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			messages = {
				enabled = true
			},
			routes = {
				-- Route vim modes and recording macro messages to bottom
				-- command line rather than default notify!
				{
					view = "cmdline",
					filter = { event = "msg_showmode" },
				},
				-- Disable a bunch of annoying messages ("...written", changes "... after...", "... before ...")
				-- Borrowed from there: https://github.com/folke/noice.nvim/issues/568#issuecomment-1673907587
				{
					filter = {
						event = 'msg_show',
						any = {
							{ find = '%d+L, %d+B' },
							{ find = '; after #%d+' },
							{ find = '; before #%d+' },
							{ find = '%d fewer lines' },
							{ find = '%d more lines' },
						},
					},
					opts = { skip = true }
				}
			},
		})
  end
}
