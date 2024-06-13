vim.api.nvim_create_user_command('TrimTrailingSpaces', function ()
	vim.cmd([[
		%s/\s\+$
	]])
end, { desc = 'Trim each line of file from trailing spaces' })

-- Taken and adapted from https://codereview.stackexchange.com/questions/274729/slugify-selection
vim.cmd([[
	function Slugify(text)
		" Patch uppercased characters with their lowercase version
		let result = substitute(a:text, "\\u", "\\l&", "g")

		" Patch all french accents I could think of in my usage with slug equivalent
		let result = substitute(result, "î\\+", "i" ,"g")
		let result = substitute(result, "û\\+", "u" ,"g")
		let result = substitute(result, "ô\\+", "o" ,"g")
		let result = substitute(result, "â\\+", "a" ,"g")
		let result = substitute(result, "é\\+", "e" ,"g")
		let result = substitute(result, "è\\+", "e" ,"g")
		let result = substitute(result, "ê\\+", "e" ,"g")
		let result = substitute(result, "ï\\+", "i" ,"g")
		let result = substitute(result, "ë\\+", "e" ,"g")

		" Patch all german special characters I could think with their slug equivalent
		let result = substitute(result, "ä\\+", "ae" ,"g")
		let result = substitute(result, "ü\\+", "ue" ,"g")
		let result = substitute(result, "ö\\+", "oe" ,"g")
		let result = substitute(result, "ß\\+", "ss" ,"g")

		" Patch my common currency signs with their slug equivalent
		" Flaw: When quantity is 1 (need to remove the s)
		let result = substitute(result, "€\\+", "euros" ,"g")
		let result = substitute(result, "£\\+", "pounds" ,"g")
		let result = substitute(result, "$\\+", "dollars" ,"g")

		" Patch anything else with a dash
		let result = substitute(result, "[^a-z0-9]\\+", "-" ,"g")

		return result
	endfunction

	command -range Slug :<line1>,<line2>s/\%V.*\%V./\=Slugify(submatch(0))/
	command -range Slurl :<line1>,<line2>s/\%V.*\%V./\="[" . submatch(0) . "](#" . Slugify(submatch(0)) . ")"/
]])


vim.cmd([[
	command! -range=% -nargs=0 Tabs2SpacesOfTwo execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*2)'
	command! -range=% -nargs=0 SpacesOfTwo2Tabs execute '<line1>,<line2>s#^\( \{2\}\)\+#\=repeat("\t", len(submatch(0))/2)'
	command! -range=% -nargs=0 Tabs2SpacesOfFour execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*4)'
	command! -range=% -nargs=0 SpacesOfFour2Tabs execute '<line1>,<line2>s#^\( \{4\}\)\+#\=repeat("\t", len(submatch(0))/4)'
]])
