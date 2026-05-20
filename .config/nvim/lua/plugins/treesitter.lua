-- https://github.com/nvim-treesitter/nvim-treesitter
-- Requires tree-sitter CLI available at https://github.com/tree-sitter/tree-sitter/releases/latest
-- Highlight, edit, and navigate code
return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install { 'javascript', 'css', 'scss', 'html', 'markdown', 'markdown_inline', 'json', 'vim', 'yaml', 'jsdoc', 'graphql', 'gitignore', 'gitcommit', 'git_rebase', 'dockerfile', 'diff', 'comment', 'bash', 'lua' }
	end
}
