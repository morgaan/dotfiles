-- Fuzzy anything (files, lsp, keymaps, commands, help...)
return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make',
			cond = vim.fn.executable 'make' == 1
		},
		'nvim-telescope/telescope-node-modules.nvim',
		'princejoogie/dir-telescope.nvim'
	},
	config = function()
		local keymap = vim.keymap.set
		-- See `:help telescope.builtin`
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		-- See `:help telescope` and `:help telescope.setup()`
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['<C-[>'] = require('telescope.actions').close
						-- By default the one below allow to scroll preview
						-- window.
						-- <C-u>/<C-d>/<C-b>/<C-f>
					}
				}
			}
		}

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
		keymap('n', '<leader>sN', '<cmd>Telescope find_files search_dirs=~/dotfiles/.config/nvim<cr>', { desc = 'Telescope: [S]earch [N]eovim config (find_files)' })
		keymap('n', '<leader>sn', '<cmd>Telescope live_grep search_dirs=~/dotfiles/.config/nvim<cr>', { desc = 'Telescope: [S]earch [N]eovim config (live_grep)' })
		keymap('n', '<leader>sm', '<cmd>Telescope node_modules list<cr>', { desc = 'Telescope: [S]earch Node [M]odules' })
		keymap('n', '<leader>gd', '<cmd>Telescope dir live_grep<cr>',  { desc = 'Telescope: [G]rep in [D]irectory', noremap = true, silent = true })
		keymap('n', '<leader>sd', '<cmd>Telescope dir find_files<cr>',  { desc = 'Telescope: [S]earch in [D]irectory...', noremap = true, silent = true })
		keymap('n', '<leader>sB', '<cmd>Telescope find_files search_dirs=~/second-brain<cr>', { desc = 'Telescope: [S]econd [B]rain (find_files)' })
		keymap('n', '<leader>sb', '<cmd>Telescope live_grep search_dirs=~/second-brain<cr>', { desc = 'Telescope: [S]econd [b]rain (live_grep' })

		-- auto command to pop up telescope for file search if `vim .` was
		-- invoked in the Terminal.
		local vimenter_group = vim.api.nvim_create_augroup('MyVimEnter', { clear = true })
		vim.api.nvim_create_autocmd({'VimEnter'}, {
			callback = function()
				if vim.v.argv[3] == '.' then
					require('telescope.builtin').find_files()
				end
			end,
			group = vimenter_group,
			pattern = '*'
		})
end
}
