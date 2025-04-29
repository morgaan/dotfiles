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
			cmdline = {
				enabled = true, -- enables the Noice cmdline UI
				--view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
				--opts = {}, -- global options for the cmdline. See section on views
				-----@type table<string, CmdlineFormat>
				--format = {
				--	-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				--	-- view: (default is cmdline view)
				--	-- opts: any options passed to the view
				--	-- icon_hl_group: optional hl_group for the icon
				--	-- title: set to anything or empty string to hide
				--	cmdline = { pattern = "^:", icon = "", lang = "vim" },
				--	search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				--	search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				--	filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				--	lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				--	help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				--	input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				--	-- lua = false, -- to disable a format, set to `false`
				--},
			},
			-- Borrowed from https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#display-the-cmdline-and-popupmenu-together
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			-- lsp = {
			-- 	-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			-- 	override = {
			-- 		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 		["vim.lsp.util.stylize_markdown"] = true,
			-- 		["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			-- 	},
			-- },
			-- -- you can enable a preset for easier configuration
			-- presets = {
			-- 	command_palette = true, -- position the cmdline and popupmenu together
			-- 	long_message_to_split = true, -- long messages will be sent to a split
			-- 	inc_rename = false, -- enables an input dialog for inc-rename.nvim
			-- 	lsp_doc_border = false, -- add a border to hover docs and signature help
			-- },
			-- messages = {
			-- 	enabled = true
			-- },
			-- routes = {
			-- 	-- Route vim modes and recording macro messages to bottom
			-- 	-- command line rather than default notify!
			-- 	{
			-- 		view = "cmdline",
			-- 		filter = { event = "msg_showmode" },
			-- 	},
			-- 	-- Disable a bunch of annoying messages ("...written", changes "... after...", "... before ...")
			-- 	-- Borrowed from there: https://github.com/folke/noice.nvim/issues/568#issuecomment-1673907587
			-- 	{
			-- 		filter = {
			-- 			event = 'msg_show',
			-- 			any = {
			-- 				{ find = '%d+L, %d+B' },
			-- 				{ find = '; after #%d+' },
			-- 				{ find = '; before #%d+' },
			-- 				{ find = '%d fewer lines' },
			-- 				{ find = '%d more lines' },
			-- 			},
			-- 		},
			-- 		opts = { skip = true }
			-- 	}
			-- },
		})
  end
}
