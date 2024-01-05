return {
	-- 'ThePrimeagen/git-worktree.nvim',
	'zkygr/git-worktree.nvim', -- This is needed until this PR: https://github.com/ThePrimeagen/git-worktree.nvim/pull/104 is merged
	event = 'VeryLazy',
	commit = 'c8ff32c',
	config = function()
		local keymap = vim.keymap.set
		local Worktree = require('git-worktree')

		Worktree.setup({
			change_directory_command = 'tcd' -- default: 'cd', `tcd` if you want to only change the `pwd` for the current vim Tab.
			-- update_on_change = <boolean> -- default: true,
			-- update_on_change_command = <str> -- default: 'e .',
			-- clearjumps_on_change = <boolean> -- default: true,
			-- autopush = <boolean> -- default: false,
		})

		-- op = Operations.Switch, Operations.Create, Operations.Delete
		-- metadata = table of useful values (structure dependent on op)
		--      Switch
		--          path = path you switched to
		--          prev_path = previous worktree path
		--      Create
		--          path = path where worktree created
		--          branch = branch name
		--          upstream = upstream remote name
		--      Delete
		--          path = path where worktree deleted
		Worktree.on_tree_change(function(op, metadata)
			if op == Worktree.Operations.Switch then
				print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
			end
			if op == Worktree.Operations.Create then
				print('Created worktree ' .. metadata.path .. ' with branch ' .. metadata.branch .. ' and from origin ' .. metadata.upstream)
			end
			if op == Worktree.Operations.Delete then
				print('Deleted worktree ' .. metadata.path)
			end
		end)

		-- Telescope integration
		pcall(require('telescope').load_extension, 'git_worktree')
		keymap('n', '<leader>mt', require('telescope').extensions.git_worktree.git_worktrees, { desc = 'Git-worktree: [M]anage Git Work[T]rees (<Enter> - Switch, <c-d> - delete, <c-f> - toggles forcing' })
		keymap('n', '<leader>ct', require('telescope').extensions.git_worktree.create_git_worktree, { desc = 'Git-worktree: [C]reate new Git Work[T]rees' })
	end
}
