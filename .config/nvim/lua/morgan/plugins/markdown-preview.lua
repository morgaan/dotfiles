-- Markdown file real-time preview
return {
	{
		'iamcco/markdown-preview.nvim',
		config = function()
			local global = vim.g

			global.mkdp_auto_start = 0
			global.mkdp_auto_close = 1

			if (vim.loop.os_uname().sysname == "Linux") then
				global.mkdp_browser = '/opt/firefox-developer-edition/firefox'
			else
				global.mkdp_browser = 'Firefox Developer Edition'
			end
		end,
		build = function()
			vim.fn['mkdp#util#install']()
		end
	}
}
