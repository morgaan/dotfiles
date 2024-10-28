-- https://github.com/catppuccin/nvim?tab=readme-ov-file#usage
return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		vim.cmd([[colorscheme catppuccin-frappe]])

		-- Overrides and add-ons
		vim.cmd([[highlight @markup.quote cterm=NONE gui=NONE guifg=#ea999c]])
		vim.cmd([[highlight @text.emphasis cterm=italic gui=italic guifg=#a6d189]])
		vim.cmd([[highlight RenderMarkdownHighlight guifg=#303446 guibg=#f2d5cf]])
	end
}
