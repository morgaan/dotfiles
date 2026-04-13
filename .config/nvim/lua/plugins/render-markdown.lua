-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
	'MeanderingProgrammer/render-markdown.nvim',
	commit = '5dcadc7',
	-- e6c8081 seems to be a breaking change for me!
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
	keys = {
      { "<leader>tr", "<cmd>RenderMarkdown toggle<cr>", desc = "[T]oggle [R]enderMarkdown" },
	},
	opts = {
		-- this win_options is making the `render_modes` behave as expected
		-- Reference: https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/303#issuecomment-2608156758
		win_options = {
			conceallevel = { default = 0, rendered = 3 },
		},
		render_modes = { 'n', 'c', 't' },
		anti_conceal = {
			enabled = true,
		},
		completions = {
			-- Settings for in-process language server completions
			lsp = { enabled = true },
			filter = {
				checkbox = function(value)
					return value.raw ~= '[-]'
				end
			}
		},
		latex = {
			enabled = false
		},
		html = {
			enabled = true,
			tag = {
				kbd = {
					icon = ' ',
					highlight = 'RenderMarkdownHtmlComment'
				}
			}
		},
		heading = {
			enabled = true,
			position = 'inline',
			width = 'block',
			-- You can search for symbols in https://www.nerdfonts.com/cheat-sheet though
			signs = {'󰉫', '󰉬', '󰉭' , '󰉮', '󰉯', '󰉰'},
			icons = {''},
			backgrounds = {
				'MyMarkdownH1',
				'MyMarkdownH2',
				'MyMarkdownH3',
				'MyMarkdownH4',
				'MyMarkdownH5',
				'MyMarkdownH6',
			},
			foregrounds = {
				'MyMarkdownH1',
				'MyMarkdownH2',
				'MyMarkdownH3',
				'MyMarkdownH4',
				'MyMarkdownH5',
				'MyMarkdownH6',
			},
		},
		dash = {
			enabled = true,
			width = 80
		},
		quote = {
			highlight = 'rainbow4',
			icon = '|';
		},
		link = {
			enabled = true,
			image = '󰥶 ',
			email = '󰁥 ',
			hyperlink = '󰌹 ',
			highlight = 'RenderMarkdownCustomLink',
			custom = {
				internalLink = { pattern = '%.md$', icon = '󱅸 ', highlight = 'RenderMarkdownCustomLink' },
				projectLink = { pattern = '%-PROJECT-', icon = '󰪺 ', highlight = 'RenderMarkdownCustomLink' },
				areaLink = { pattern = '%-AREA-', icon = '󰻿 ', highlight = 'RenderMarkdownCustomLink' },
				ghLink = { pattern = '^http[s]?://.*github.com.*', icon = ' ', highlight = 'RenderMarkdownCustomLink' },
				glLink = { pattern = '^http[s]?://.*gitlab.com.*', icon = ' ', highlight = 'RenderMarkdownCustomLink' },
				soLink = { pattern = '^http[s]?://.*stackoverflow.com.*', icon = ' ', highlight = 'RenderMarkdownCustomLink' },
				redditLink = { pattern = '^http[s]?://.*reddit.com.*', icon = ' ', highlight = 'RenderMarkdownCustomLink' },
				ytLink = { pattern = '^http[s]?://.*youtube.com.*', icon = '󰗃 ', highlight = 'RenderMarkdownCustomLink' },
				ytmLink = { pattern = '^http[s]?://.*youtu.be.*', icon = '󰗃 ', highlight = 'RenderMarkdownCustomLink' },
				gmapLink = { pattern = '^http[s]?://.*google.com/maps.*', icon = '󰗵 ', highlight = 'RenderMarkdownCustomLink' },
				gmailLink = { pattern = '^http[s]?://.*google.com/mail.*', icon = '󰊫 ', highlight = 'RenderMarkdownCustomLink' },
				spotifyLink = { pattern = '^http[s]?://.*spotify.com.*', icon = ' ', highlight = 'RenderMarkdownCustomLink' },
				web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownCustomLink' }
			},
		},
		code = {
			enabled = true,
			sign = false,
			position = 'left',
			width = 'block',
			min_width = 81,
			left_pad = 2,
			right_pad = 2
		},
		bullet = {
			icons = { '–' },
			highlight = 'RenderMarkdownChecked'
		},
		checkbox = {
			enabled = true,
			unchecked = {
				icon = ' ',
				highlight = 'RenderMarkdownUnchecked',
				scope_highlight = nil,
			},
			checked = {
				icon = ' ',
				highlight = 'RenderMarkdownChecked',
				scope_highlight = nil,
			},
			custom = {
				Mood = { raw = '[~]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				Event = { raw = '[o]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				Appointment = { raw = '[^]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				Capture = { raw = '[*]', rendered = ' ', highlight = 'rainbow3', scope_highlight = nil },
				WiP = { raw = '[/]', rendered = ' ', highlight = 'DiagnosticWarn', scope_highlight = nil },
				Migrated = { raw = '[>]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				Moved = { raw = '[<]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				Delegated = { raw = '[d]', rendered = '  ', highlight = 'RenderMarkdownChecked', scope_highlight = nil }
			}
		},
        -- Mimics Obsidian inline highlights when content is surrounded by double equals
        -- The equals on both ends are concealed and the inner content is highlighted
        inline_highlight = {
            -- Turn on / off inline highlight rendering
            enabled = true,
            -- Applies to background of surrounded text
            highlight = 'RenderMarkdownCustomHighlight',
        },
		--custom_handlers = {
		--	markdown = {
		--	extends = true,
		--	parse = function(root, buf)
		--		local marks = {}

		--		---@param row { [1]: integer, [2]: integer }
		--		---@param col { [1]: integer, [2]: integer }
		--		---@param conceal? string
		--		---@param hl_group? string
		--		local function append(row, col, conceal, hl_group)
		--		table.insert(marks, {
		--			conceal = row[1] == row[2],
		--			start_row = row[1],
		--			start_col = col[1],
		--			opts = { end_row = row[2], end_col = col[2], conceal = conceal, hl_group = hl_group },
		--		})
		--		end

		--		local text = vim.treesitter.get_node_text(root, buf)
		--		local top_row = root:range()

		--		---@param index integer
		--		---@return integer, integer
		--		local function row_col(index)
		--		local lines = vim.split(text:sub(1, index), '\n', { plain = true })
		--		return top_row + #lines - 1, #lines[#lines]
		--		end

		--		---@type integer|nil
		--		local index = 1
		--		while index ~= nil do
		--		local start_index, end_index = text:find('(=)=[^=]+=(=)', index)
		--		if start_index ~= nil and end_index ~= nil then
		--			local start_row, start_col = row_col(start_index - 1)
		--			local end_row, end_col = row_col(end_index)
		--			-- Hide first 2 equal signs
		--			append({ start_row, start_row }, { start_col, start_col + 2 }, '', nil)
		--			-- Highlight contents
		--			append({ start_row, end_row }, { start_col, end_col }, nil, 'RenderMarkdownCustomHighlight')
		--			-- Hide last 2 equal signs
		--			append({ end_row, end_row }, { end_col - 2, end_col }, '', nil)
		--			index = end_index + 1
		--		else
		--			index = nil
		--		end
		--		end

		--		return marks
		--	end,
		--	}
		--}
	}
}
