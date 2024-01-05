return {
	'ishan9299/nvim-solarized-lua',
	priority = 1000, -- make sure to load first
	config = function()
		vim.cmd([[colorscheme solarized]])
	end
}

