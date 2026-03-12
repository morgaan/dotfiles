-- https://github.com/ixru/nvim-markdown
-- Nice mappings to learn TBH: https://github.com/ixru/nvim-markdown?tab=readme-ov-file#mappings
return {
	'ixru/nvim-markdown',
	-- Fork from 'preservim/vim-markdown',
	-- This avoid the annoying override of `ge` + adds convenient `<C-k>` to
	-- Create links [link text](url) in insert or visual mode. If pressed in an
	-- url, or in a word, it will autofill the correct field. tab can be used in
	-- insert mode to skip from one field to the next.
	--
	-- Note: In auto-commands.lua, there is some vimscript to prevent markdown
	-- links to break up when the tag is crossing the textwidth, by
	-- accommodating a bigger textwidth for that particular line
	event = {'BufReadPre', 'BufNewFile'},
	dependencies = {'godlygeek/tabular'},
	config = function()
		local global = vim.g

		global.vim_markdown_folding_disabled = 1
		global.vim_markdown_frontmatter = 1
		global.vim_markdown_auto_insert_bullets = 0

		-- This unmap '<tab>' to fold functionality as it seems to nuke `CTRL-I`
		-- which is synonymous of `<tab>` and that I'd rather use for navigating
		-- the jump list.
		vim.cmd[[map <Plug> <Plug>Markdown_Fold]]
	end
}
