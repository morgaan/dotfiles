vim.api.nvim_create_user_command('TrimTrailingSpaces', function ()
	vim.cmd([[
		%s/\s\+$
	]])
end, { desc = 'Trim each line of file from trailing spaces' })

