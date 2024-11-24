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

-- Source: Prevent Vim from breaking up links mid-tag in markdown
-- https://vi.stackexchange.com/questions/564/prevent-vim-from-breaking-up-links-mid-tag-in-markdown#649
--
-- May have some flaws but seems to work eventually. If I use `<C-k>`
-- mapping introduced by 'ixru/nvim-markdown' plugin to insert a markdown
-- link as I write if should be alright!
--
-- TODO: Migrate this to lua potentially
vim.api.nvim_exec([[
	au CursorMovedI *.md call ModifyTextWidth() " Use only within *.md files

	function! ModifyTextWidth()
		if getline(".")=~'^.*\[.*\](.*)$' " If the line ends with Markdown link - set big value for textwidth
			setlocal textwidth=500
		else
			setlocal textwidth=80 " Otherwise use normal textwidth
		endif
	endfunction
]], false)
