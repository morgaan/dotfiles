-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
	'MeanderingProgrammer/render-markdown.nvim',
	commit = '3a319cd',
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
	opts = {
		render_modes = { 'n', 'c', 'i' },
		anti_conceal = {
			enabled = true,
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
				capture = { raw = '[*]', rendered = ' ', highlight = 'rainbow3', scope_highlight = nil },
				wip = { raw = '[/]', rendered = ' ', highlight = 'DiagnosticWarn', scope_highlight = nil },
				migrated = { raw = '[>]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				moved = { raw = '[<]', rendered = ' ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
				delegated = { raw = '[d]', rendered = '  ', highlight = 'RenderMarkdownChecked', scope_highlight = nil }
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
