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

-- Force shell interactive mode so that .zshrc commands are known in Vim.
local vimenter_group = vim.api.nvim_create_augroup('vimenter_group', { clear = true })
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
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  command = 'silent! checktime',
  group = changes_tracking,
  pattern = '*'
})
vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
  group = changes_tracking,
  pattern = '*'
})

local on_resize = vim.api.nvim_create_augroup('OnVimResize', { clear = true })
vim.api.nvim_create_autocmd({'VimResized'}, {
  command = 'wincmd =',
  group = on_resize,
  pattern = '*'
})

