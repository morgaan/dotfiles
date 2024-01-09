return {
	'vimwiki/vimwiki',
	event = 'VeryLazy',
	config = function()
		local global = vim.g
		local keymap = vim.keymap.set

		global.vimwiki_list = {{path = '~/notebook/notes', syntax = 'markdown', ext = '.md', links_space_char = '-'}}
		global.vimwiki_ext2syntax = {['.md'] = 'markdown', ['.markdown'] = 'markdown', ['.mdown'] = 'markdown'}
		global.vimwiki_global_ext = 0

		-- Telescope integration
		function _G.find_vim_wiki_notes()
			require('telescope.builtin').find_files({
				search_dirs= {'~/notebook/notes/'},
				prompt_title = 'Search Vim Wiki files',
				path_display = function(_, path)
					return require('telescope.utils').transform_path({path_display={'tail'}}, path)
				end
			})
		end

		function _G.live_grep_vim_wiki_notes()
			require('telescope.builtin').live_grep({
				search_dirs = {'~/notebook/notes/'},
				theme = 'dropdown',
				prompt_title = 'Grep Vim Wiki notes'
			})
		end

		keymap('n', '<leader>sn', _G.live_grep_vim_wiki_notes, { desc = 'Vimwiki: [S]earch Vimwiki [N]otes' })
		keymap('n', '<leader>sN', _G.find_vim_wiki_notes, { desc = 'Vimwiki: [S]earch Vimwiki [N]otes files' })

-- 		-- Look for your vimwiki pages using telescope!
-- 		pcall(require('telescope').load_extension, 'vimwiki')
	end
}
