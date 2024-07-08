return {
	'ixru/nvim-markdown',
	-- Fork from 'preservim/vim-markdown',
	-- This avoid the annoying override of `ge` + adds convenient `<C-k>` to
	-- Create links [link text](url) in insert or visual mode. If pressed in an
	-- url, or in a word, it will autofill the correct field. tab can be used in
	-- insert mode to skip from one field to the next.
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'godlygeek/tabular'},
	config = function()
		local global = vim.g

		global.vim_markdown_folding_disabled = 1
		global.vim_markdown_frontmatter = 1
		global.vim_markdown_auto_insert_bullets = 0
	end
}
