-- Fuzzy anything (files, lsp, keymaps, commands, help...)
return {
	'nvim-telescope/telescope.nvim',
	-- branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			branch = 'main',
			-- Last version before using `cmake` that I do not have on my
			-- machine. Had to fix that because the extension was not loading at
			-- all and I couldn't use the fzf search tokens
			commit = 'f297259',
			run = 'make',
			cond = vim.fn.executable 'make' == 1
		},
		'nvim-telescope/telescope-node-modules.nvim',
		'fbuchlak/telescope-directory.nvim',
		-- It sets vim.ui.select to telescope. That means for example that
		-- neovim core stuff can fill the telescope picker. Example would be lua
		-- vim.lsp.buf.code_action().
		'nvim-telescope/telescope-ui-select.nvim'

		-- 'princejoogie/dir-telescope.nvim'
	},
	config = function()
		local keymap = vim.keymap.set

		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')
		local actions_utils = require('telescope.actions.utils')

		-- Taken from: https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
		local select_one_or_multi = function(prompt_bufnr)
			local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
			local multi = picker:get_multi_selection()
			if not vim.tbl_isempty(multi) then
				actions.close(prompt_bufnr)
				for _, j in pairs(multi) do
					if j.path ~= nil then
						if j.lnum ~= nil then
							-- Taken from: https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1991532321
							vim.cmd(string.format("%s %s:%s", "edit", j.path, j.lnum))
						else
							vim.cmd(string.format("%s %s", "edit", j.path))
						end
					end
				end
			else
				actions.select_default(prompt_bufnr)
			end
		end

		-- Harpoon mark files from telescope picker
		-- Taken from https://gist.github.com/benlubas/09254459af633cce1b5ac12d16640f0e
		local harpoon_file_from_telescope_selection = function(tb)
			actions.drop_all(tb)
			actions.add_selection(tb)

			actions_utils.map_selections(tb, function(selection)
				local file = selection[1]

				-- This lets it work with live grep picker
				if selection.filename then
				file = selection.filename
				end

				-- this lets it work with git status picker
				if selection.value then
				file = selection.filename
				end

				pcall(require("harpoon.mark").add_file, file)
			end)

			actions.remove_selection(tb)
		end

		-- Taken from https://github.com/nvim-telescope/telescope.nvim/issues/2778#issuecomment-2481005686
		local focus_preview = function(prompt_bufnr)
			local action_state = require("telescope.actions.state")
			local picker = action_state.get_current_picker(prompt_bufnr)
			local prompt_win = picker.prompt_win
			local previewer = picker.previewer
			local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
			local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]

			vim.keymap.set("n", "<Tab>", function()
				vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
			end, { buffer = bufnr })

			vim.keymap.set("n", "<C-[>", function()
				actions.close(prompt_bufnr)
			end, { buffer = bufnr })

			vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
			-- api.nvim_set_current_win(winid)
		end

		local find_second_brain_files = function()
			builtin.find_files({
				search_dirs = {'~/second-brain'},
				file_ignore_patterns = {'4-Archives/.pre-second-brain-archive-20240301'}
			})
		end

		-- See `:help telescope` and `:help telescope.setup()`
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<Tab>'] = focus_preview,
						['<C-[>'] = actions.close,
						["<C-w>"] = function()
							vim.api.nvim_input "<c-s-w>"
						end,
						['<CR>'] = select_one_or_multi,
						['<C-h>'] = harpoon_file_from_telescope_selection,
						-- To scroll preview window.
						-- Vertically: <C-u>/<C-d>
						-- Horizontally: <C-f>/<C-k>
						--
						-- To scroll results window.
						-- Vertically: <PageUp>/<PageDown>
						-- Horizontally: <M-f>/<M-k>
					}
				}
			},
			extensions = {
				['ui-select'] = {
					require("telescope.themes").get_dropdown {}
				}
			}
		}

		require('morgan.config.telescope.multigrep').setup()

		-- Telescope extensions:
		--
		-- Enable telescope fzf native, if installed
		-- | Token   | Match type                 | Description                          |
		-- | ------- | -------------------------- | ------------------------------------ |
		-- | sbtrkt  | fuzzy-match                | Items that match `sbtrkt`            |
		-- | 'wild   | exact-match (quoted)       | Items that include `wild`            |
		-- | ^music  | prefix-exact-match         | Items that start with `music`        |
		-- | .mp3$   | suffix-exact-match         | Items that end with `.mp3`           |
		-- | !fire   | inverse-exact-match        | Items that do not include `fire`     |
		-- | !^music | inverse-prefix-exact-match | Items that do not start with `music` |
		-- | !.mp3$  | inverse-suffix-exact-match | Items that do not end with `.mp3`    |
		pcall(require('telescope').load_extension, 'fzf')

		pcall(require('telescope').load_extension, 'node_modules')
		pcall(require('telescope').load_extension, 'ui-select')

		-- Keymaps:
		keymap('n', '<C-p>', function()
			builtin.git_files({ use_git_root = false })
		end, { desc = 'Telescope: [<C-p>] Find files under git versioning only' })
		keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Telescope: [?] Find recently opened files' })
		keymap('n', '<leader>vd', builtin.diagnostics, { desc = 'Telescope: [V]iew workspace [D]iagnostic' })
		keymap('n', '<leader>gb', function()
			builtin.buffers({path_display = { shorten = 3}})
		end, { desc = 'Telescope: [G]o to [B]uffer'})

		keymap('n', '<leader>sl', function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = 'Telescope: [S]earch [L]ines' })

		keymap('n', '<leader>sf', function()
			builtin.find_files({ hidden = true, file_ignore_patterns = {'node_modules'}})
		end, { desc = 'Telescope: [S]earch [F]iles' })
		keymap('n', '<leader>rt', builtin.resume, { desc = 'Telescope: [R]esume [T]elescope' })
		keymap('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope: [S]earch [H]elp' })
		keymap('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: [S]earch current [W]ord' })
		keymap('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope: [S]earch by [G]rep' })
		keymap('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope: [S]earch [K]eymaps' })
		keymap('n', '<leader>sc', builtin.commands, { desc = 'Telescope: [S]earch [C]ommands' })
		keymap('n', '<leader>sm', '<cmd>Telescope node_modules list<cr>', { desc = 'Telescope: [S]earch Node [M]odules' })
		keymap('n', '<leader>sd', '<cmd>Telescope directory live_grep theme=dropdown previewer=false hidden=true<cr>',  { desc = 'Telescope: [G]rep from within [D]irectory...', noremap = true, silent = true })
		keymap('n', '<leader>sD', '<cmd>Telescope directory find_files theme=dropdown hidden=true<cr>',  { desc = 'Telescope: [S]earch to find files in [D]irectory...', noremap = true, silent = true })
		keymap('n', '<leader>gd', '<cmd>Telescope directory hidden=true theme=dropdown feature=open_in_file_explorer <cr>',  { desc = 'Telescope: [G]o to [D]irectory', noremap = true, silent = true })

		-- Second Brain
		keymap('n', '<leader>sB', find_second_brain_files, { desc = 'Telescope: [S]econd [B]rain (find_files)' })
		keymap('n', '<leader>sb', function()
			builtin.live_grep({
				search_dirs = {'~/second-brain'},
				file_ignore_patterns = {'4-Archives/zzz_pre-second-brain-archive-20240301'}
			})
		end, { desc = 'Telescope: [S]econd [b]rain (live_grep)' })
		keymap('n', '<leader>sA', function()
			builtin.find_files({
				search_dirs = {'~/second-brain/4-Archives/zzz_pre-second-brain-archive-20240301'},
			})
		end, { desc = 'Telescope: [S]econd brain notes [A]rchive (find_files)' })
		keymap('n', '<leader>sa', function()
			builtin.live_grep({
				search_dirs = {'~/second-brain/4-Archives/zzz_pre-second-brain-archive-20240301'},
			})
		end, { desc = 'Telescope: [S]earch notes [a]rchive (live_grep)' })
		keymap('n', '<leader>sT', function()
			builtin.find_files({
				search_dirs = {'~/second-brain/.templates'},
			})
		end, { desc = 'Telescope: [S]earch second brain [T]emplates (find_files)' })

		-- Search Neovim config
		keymap('n', '<leader>sN', '<cmd>Telescope find_files search_dirs=~/dotfiles/.config/nvim<cr>', { desc = 'Telescope: [S]earch [N]eovim config (find_files)' })
		keymap('n', '<leader>sn', '<cmd>Telescope live_grep search_dirs=~/dotfiles/.config/nvim<cr>', { desc = 'Telescope: [S]earch [N]eovim config (live_grep)' })

		-- auto command to pop up telescope for file search if `vim .` was
		-- invoked in the Terminal.
		local vimenter_group = vim.api.nvim_create_augroup('MyVimEnter', { clear = true })
		vim.api.nvim_create_autocmd({'VimEnter'}, {
			callback = function()
				if vim.v.argv[3] == '.' then
					if string.sub(vim.fn.getcwd(), -13) == '/second-brain' then
						-- Hide hidden files to unclutter the vault
						vim.cmd.normal('g.')

						find_second_brain_files()
					else
						require('telescope.builtin').find_files()
					end
				end
			end,
			group = vimenter_group,
			pattern = '*'
		})
end
}
