-- Disables search highlighting when you are done searching and re-enables
-- it when you search again
return {
	'romainl/vim-cool',
	event = {'BufReadPre', 'BufNewFile'}
}
