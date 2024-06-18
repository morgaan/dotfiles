-- https://github.com/catppuccin/nvim?tab=readme-ov-file#usage
return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		vim.cmd([[colorscheme catppuccin-frappe]])
	end
}
