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

function _G.find_vim_wiki_notes()
  require('telescope.builtin').find_files({
	search_dirs= {'~/notebook/notes/'},
    prompt_title = 'Search Vim Wiki files',
    path_display = function(_, path)
	  return require('telescope.utils').transform_path({path_display={'tail'}}, path)
    end
  })
end
function _G.live_grep_vim_wiki_notes()
  require('telescope.builtin').live_grep({
	search_dirs = {'~/notebook/notes/'},
	theme = 'dropdown',
	prompt_title = 'Grep Vim Wiki notes'
  })
end

-- Take git worktree experience to the next level
pcall(require('telescope').load_extension, 'git_worktree')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
	builtin.git_files({ use_git_root = false })
end, { desc = '[<C-p>] Find files under git versioning only' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>gb', builtin.buffers, { desc = '[G]o to [B]uffer'})

vim.keymap.set('n', '<leader>sl', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[S]earch [L]ines' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope find_files search_dirs=~/dotfiles/.config/nvim<cr>', { desc = '[S]earch Vim [C]onfig' })
vim.keymap.set('n', '<leader>sn', _G.live_grep_vim_wiki_notes, { desc = '[S]earch Vimwiki [N]otes' })
vim.keymap.set('n', '<leader>sN', _G.find_vim_wiki_notes, { desc = '[S]earch Vimwiki [N]otes files' })
vim.keymap.set('n', '<leader>mt', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[M]anage Git Work[T]rees (<Enter> - Switch, <c-d> - delete, <c-f> - toggles forcing' })
vim.keymap.set('n', '<leader>ct', require('telescope').extensions.git_worktree.create_git_worktree, { desc = '[C]reate new Git Work[T]rees' })
vim.keymap.set('n', '<leader>hm', require('telescope').extensions.harpoon.marks, { desc = '[H]arpoon [M]arks' })
