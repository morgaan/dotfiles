-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*'
})

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
-- Force shell interactive mode so that .zshrc commands are known in Vim.
vim.api.nvim_create_autocmd({'VimEnter'}, {
  command = "let &shell='/bin/zsh -i'",
  group = vimenter_group,
  pattern = '*'
})

local netrw_mappings = vim.api.nvim_create_augroup('netrw_mappings', { clear = true })
vim.api.nvim_create_autocmd({'Filetype'}, {
  callback = function()
	  vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<cr>', { buffer=true })
	  vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<cr>', { buffer=true })
	  vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<cr>', { buffer=true })
	  vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<cr>', { buffer=true })
  end,
  group = netrw_mappings,
  pattern = 'netrw'
})

local changes_tracking = vim.api.nvim_create_augroup('ChangesTracking', { clear = true })
vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
  command = 'silent! checktime',
  group = changes_tracking,
  pattern = '*'
})
