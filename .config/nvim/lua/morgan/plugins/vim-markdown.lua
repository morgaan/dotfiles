return {
	'preservim/vim-markdown',
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'godlygeek/tabular'},
	config = function()
		local global = vim.g

		global.vim_markdown_folding_disabled = 1
		global.vim_markdown_frontmatter = 1
		global.vim_markdown_auto_insert_bullets = 0
	end
}
