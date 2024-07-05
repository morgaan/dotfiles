return {
	'norcalli/nvim-colorizer.lua',
	event = {'BufReadPre', 'BufNewFile'},
	config = function()
		-- https://github.com/norcalli/nvim-colorizer.lua?tab=readme-ov-file#customization
		require('colorizer').setup()
	end
}

