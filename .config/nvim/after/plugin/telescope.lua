local keymap = vim.keymap.set
-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
		['<C-[>'] = require('telescope.actions').close,
        ['<C-u>'] = false,
        ['<C-d>'] = false
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
-- Look for your vimwiki pages using telescope!
pcall(require('telescope').load_extension, 'vimwiki')
-- Take git worktree experience to the next level
pcall(require('telescope').load_extension, 'git_worktree')

-- Keymaps:
keymap('n', '<C-p>', function()
	builtin.git_files({ use_git_root = false })
end, { desc = 'Telescope: [<C-p>] Find files under git versioning only' })
keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Telescope: [?] Find recently opened files' })
keymap('n', '<leader>gb', builtin.buffers, { desc = 'Telescope: [G]o to [B]uffer'})

keymap('n', '<leader>sl', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Telescope: [S]earch [L]ines' })

keymap('n', '<leader>sf', builtin.find_files, { desc = 'Telescope: [S]earch [F]iles' })
keymap('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope: [S]earch [H]elp' })
keymap('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: [S]earch current [W]ord' })
keymap('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope: [S]earch by [G]rep' })
keymap('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope: [S]earch [K]eymaps' })
keymap('n', '<leader>sc', '<cmd>Telescope find_files search_dirs=~/dotfiles/.config/nvim<cr>', { desc = 'Telescope: [S]earch Vim [C]onfig' })

