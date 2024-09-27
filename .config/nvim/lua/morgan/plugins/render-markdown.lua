-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
	'MeanderingProgrammer/render-markdown.nvim',
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'},
	opts = {
		anti_conceal = {
			enabled = true
		},
		heading = {
			enabled = true,
			width = 'block',
			-- Could not find where these are coming from, not from
			-- `nvim-web-devicons` as it seems not to be listed in
			-- `:NvimWebDeviconsHiTest`
			-- icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
			icons = {},
		},
		link = {
			enabled = true,
			image = '󰥶 ',
			email = '󰀓 ',
			hyperlink = '󰌹 ',
			highlight = 'RenderMarkdownLink',
			custom = {
				web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
			},
		},
		code = {
			enabled = true,
			position = 'left',
			width = 'block'
		}
	}
}
