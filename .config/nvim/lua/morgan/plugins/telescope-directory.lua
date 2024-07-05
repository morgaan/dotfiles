return {
	'fbuchlak/telescope-directory.nvim',
	config = {
		features = {
			{
				name = "open_in_file_explorer",
				callback = function(dirs, feature_opts)
					local dir = dirs[1] -- open single directory (ignore multiple selection)

					-- 1. netrw
					-- vim.cmd(("Vex %s"):format(dir))

					-- 2. https://github.com/echasnovski/mini.files
					-- require("mini.files").open(dir)

					-- 3. https://github.com/stevearc/oil.nvim
					require("oil").open(dir)
					-- or
					-- require("oil").open_float(dir)
				end
			},
		}
	},
	dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    }
}
