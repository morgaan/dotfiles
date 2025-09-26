-- Replacer to markdown-preview in my workflow
-- https://github.com/toppair/peek.nvim
--
-- If Deno is not on the machine, you'll need it:
-- `curl -fsSL https://deno.land/install.sh | sh`
return {
	'toppair/peek.nvim',
	event = { 'VeryLazy' },
	build = 'deno task --quiet build:fast',
	config = function()
		local config = {
			-- whether to automatically load preview when entering another
			-- markdown buffer
			auto_load = true,
			-- close preview window on buffer delete
			close_on_bdelete = true,
			-- enable syntax highlighting, affects performance
			syntax = true,
			-- 'dark' or 'light'
			theme = 'dark',

			update_on_change = true,

			-- 'webview', 'browser', string or a table of strings
			-- app = 'chromium'
			-- app = { 'chromium', '--new-window' }
			-- Chromium based browser is recommended.
			-- app = 'webview',
			-- app = { 'chrome', '--new-window' },

			-- list of filetypes to recognize as markdown
			filetype = { 'markdown' },

			-- relevant if update_on_change is true

			-- start throttling when file exceeds this amount of bytes in size
			throttle_at = 200000,
			-- minimum amount of time in milliseconds that has to pass before
			-- starting new render
			throttle_time = 'auto',
		}

		if (vim.loop.os_uname().sysname == "Linux") then
			config.app = '/opt/firefox-developer-edition/firefox'
		else
			config.app = 'Firefox Developer Edition'
		end

		require("peek").setup(config)
		vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
		vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

		local keymap = vim.keymap.set

		keymap('n', '<leader>md', ':PeekOpen<CR>', { desc = 'Open Markdown preview using Peek' })
		keymap('n', '<leader>mx', ':PeekClose<CR>', { desc = 'Close Mardown preview using Peek' })
	end,
}
