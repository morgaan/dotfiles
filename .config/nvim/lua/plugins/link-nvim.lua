-- https://github.com/qadzek/link.vim
return {
	{
		'qadzek/link.vim',
		ft = { 'markdown', 'gitcommit' },
		-- link.vim is a plugin for Vim and Neovim that keeps long URLs out of your
		-- way. It supports links in Markdown syntax and plaintext links (e.g. in
		-- emails, in text files etc.)
		event = {'BufReadPre', 'BufNewFile'},
		config = function()
			local global = vim.g
			local keymap = vim.keymap.set

			global.link_heading = ''
			global.link_include_blockquotes = 1
			global.link_start_index = 1
			global.link_use_default_mappings = 0
			global.link_disable_internal_links = 0

			keymap('n', '<LocalLeader>j', '<plug>(LinkVim-Jump)')
			keymap('n', '<LocalLeader>p', '<plug>(LinkVim-Peek)')
			keymap('n', '<LocalLeader>o', '<plug>(LinkVim-Open)')
			keymap('n', '<LocalLeader>r', '<plug>(LinkVim-Reformat)')
			keymap('n', '<LocalLeader>c', '<Plug>(LinkVim-ConvertSingle)')
			keymap('i', '<C-g>c'        , '<Plug>(LinkVim-ConvertSingleInsert)')
			keymap('v', '<LocalLeader>c', '<plug>(LinkVim-ConvertRange)')
			keymap('n', '<LocalLeader>a', '<plug>(LinkVim-ConvertAll)')
			keymap('n', '<LocalLeader>s', '<plug>(LinkVim-Show)')

			-- global.link_use_default_mappings = 1
			-- Above config would turns the below mappings
			-- :LinkConvertSingle 	LocalLeader + c 	Convert link under cursor
			-- 					<C-g> + c 	Same, but from insert mode
			-- :LinkConvertRange 	LocalLeader + c 	Convert links on visually selected lines
			-- :LinkConvertAll 	LocalLeader + a 	Convert all links in document
			-- :LinkJump 	LocalLeader + j 	Jump to and from reference section
			-- :LinkOpen 	LocalLeader + o 	Open link in browser
			-- :LinkPeek 	LocalLeader + p 	Show link preview
			-- :LinkReformat 	LocalLeader + r 	Renumber/merge/delete unneeded links
			--
			-- Note that by default, <LocalLeader> is the backslash key. Run
			-- :help link-mappings to view how to change these key bindings.

			-- Read :help link-configuration to learn how to customize or
			-- disable the heading, the position of the reference section, which
			-- lines to skip and more.
		end
	}
}

