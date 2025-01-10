-- Markdown file real-time preview
-- https://github.com/iamcco/markdown-preview.nvim
return {
	{
		'iamcco/markdown-preview.nvim',
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- This build command seems to not execute
		-- Had to `:lua vim.fn["mkdp#util#install"]()` to get it install and
		-- then it worked. Looks like how I configured it, it is not being
		-- considered. I'm not an isolated case:
		-- https://github.com/iamcco/markdown-preview.nvim/issues/558
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			local global = vim.g

			global.mkdp_auto_start = 0
			global.mkdp_auto_close = 1

			if (vim.loop.os_uname().sysname == "Linux") then
				global.mkdp_browser = '/opt/firefox-developer-edition/firefox'
			else
				global.mkdp_browser = 'Firefox Developer Edition'
			end
		end
	}
}
