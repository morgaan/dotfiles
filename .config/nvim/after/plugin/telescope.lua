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

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[<C-p>] Find files under git versioning only' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', 'gb', builtin.buffers, { desc = '[G]o to [B]uffer'})

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

-- Vimwiki mappings
vim.keymap.set('n', '<leader>sn', '<cmd>Telescope live_grep search_dirs=~/notebook/notes/ theme=dropdown<cr>', { desc = '[S]earch [N]otes' })
