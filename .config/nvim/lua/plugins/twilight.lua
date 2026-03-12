-- https://github.com/folke/twilight.nvim
-- Usage:
--	- Twilight: toggle twilight
-- 	- TwilightEnable: enable twilight
-- 	- TwilightDisable: disable twilight
return {
	{
		"folke/twilight.nvim",
		event = {'BufReadPre', 'BufNewFile'},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings https://github.com/folke/twilight.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
		}
	}
}
