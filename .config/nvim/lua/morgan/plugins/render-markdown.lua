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
			width = 'block'
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
