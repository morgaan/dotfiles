vim.api.nvim_set_hl(0, 'InYourFacePink', {bold=true, bg='magenta', fg='white'})

-- Italicised comments and attributes.
vim.api.nvim_set_hl(0, 'Comment', {italic=true, fg='#5f87df'})
vim.api.nvim_set_hl(0, 'htmlArg', {italic=true, fg='#af8700'})

-- Status line highlights
vim.api.nvim_set_hl(0, 'StatuslineFilename', {bold=true, fg='#b58900'})
vim.api.nvim_set_hl(0, 'StatuslineCustom', {fg='#D9D9D9', bg='#565656'})

-- More contrasted CursorLineNr, Cursor and ColorColumn
vim.api.nvim_set_hl(0, 'CursorLineNr', {link='InYourFacePink'})
vim.api.nvim_set_hl(0, 'ColorColumn', {bg='#073642'})
vim.api.nvim_set_hl(0, 'Cursor', {link='CursorLineNr'})

-- More contrasted Visual selection
vim.api.nvim_set_hl(0, 'Visual', {reverse=false, bg='#B58900', fg='#073642'})

-- Fix highlights issues with Telescope
vim.api.nvim_set_hl(0, 'TelescopeSelection', {fg='#D9D9D9', bg='#565656'})
vim.api.nvim_set_hl(0, 'TelescopeMatching', {link='InYourFacePink'})

