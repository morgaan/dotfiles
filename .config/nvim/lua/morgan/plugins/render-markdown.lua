-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
	'MeanderingProgrammer/render-markdown.nvim',
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
	opts = {
		render_modes = { 'n', 'c', 'i' },
		anti_conceal = {
			enabled = true,
		},
		heading = {
			enabled = true,
			width = 'block',
			-- Could not find where these are coming from, not from
			-- `nvim-web-devicons` as it seems not to be listed in `:NvimWebDeviconsHiTest`
			-- You can search for symbols in https://www.nerdfonts.com/cheat-sheet though
			-- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
			-- icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
			-- Taken from https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/170
			-- icons = { "◈ ", "◇◇ ", "◆◆◆ ", "⋄⋄⋄⋄ ", "❖❖❖❖❖ ", "⟡⟡⟡⟡⟡⟡⟡  " },
			-- icons = { '󰪥', '󰺕', '', '', '', '' },
			right_pad = 1,
			icons = {''},
			signs = {' 󰉫', ' 󰉬', ' 󰉭' , ' 󰉮', ' 󰉯', ' 󰉰'},
			position = 'inline'
		},
		dash = {
			enabled = true,
			width = 80
		},
		link = {
			enabled = true,
			image = '󰥶 ',
			email = '󰁥 ',
			hyperlink = '󰌹 ',
			highlight = 'RenderMarkdownLink',
			custom = {
				web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
				internalLink = { pattern = '%.md$', icon = '󱗖 ', highlight = 'RenderMarkdownLink' },
			},
		},
		bullet = {
			icons = { '●', '○', '◆', '◇' }
		},
		code = {
			enabled = true,
			position = 'left',
			width = 'block'
		},
		custom_handlers = {
			markdown = {
			extends = true,
			parse = function(root, buf)
				local marks = {}

				---@param row { [1]: integer, [2]: integer }
				---@param col { [1]: integer, [2]: integer }
				---@param conceal? string
				---@param hl_group? string
				local function append(row, col, conceal, hl_group)
				table.insert(marks, {
					conceal = row[1] == row[2],
					start_row = row[1],
					start_col = col[1],
					opts = { end_row = row[2], end_col = col[2], conceal = conceal, hl_group = hl_group },
				})
				end

				local text = vim.treesitter.get_node_text(root, buf)
				local top_row = root:range()

				---@param index integer
				---@return integer, integer
				local function row_col(index)
				local lines = vim.split(text:sub(1, index), '\n', { plain = true })
				return top_row + #lines - 1, #lines[#lines]
				end

				---@type integer|nil
				local index = 1
				while index ~= nil do
				local start_index, end_index = text:find('(=)=[^=]+=(=)', index)
				if start_index ~= nil and end_index ~= nil then
					local start_row, start_col = row_col(start_index - 1)
					local end_row, end_col = row_col(end_index)
					-- Hide first 2 equal signs
					append({ start_row, start_row }, { start_col, start_col + 2 }, '', nil)
					-- Highlight contents
					append({ start_row, end_row }, { start_col, end_col }, nil, '@text.warning')
					-- Hide last 2 equal signs
					append({ end_row, end_row }, { end_col - 2, end_col }, '', nil)
					index = end_index + 1
				else
					index = nil
				end
				end

				return marks
			end,
			}
		}
	}
}
