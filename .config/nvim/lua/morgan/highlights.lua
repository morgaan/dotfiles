-- Italicised comments and attributes.
vim.cmd([[
	highlight Comment cterm=italic gui=italic guifg=#5f87df
	highlight htmlArg cterm=italic gui=italic guifg=#af8700
]])

-- Status line highlights
vim.cmd([[
	highlight StatuslineFilename cterm=bold ctermfg=136 gui=bold guifg=#b58900
	highlight StatuslineCustom ctermfg=252 ctermbg=238 guifg=#D9D9D9 guibg=#565656
]])

-- More contrasterd CursorLineNr, Cursor and ColorColumn
vim.cmd([[
	highlight CursorLineNr ctermbg=magenta ctermfg=white guibg=magenta guifg=white
	highlight Cursor ctermbg=yellow ctermfg=black guibg=yellow guifg=black
	highlight ColorColumn ctermbg=darkgrey guibg=#073642
]])
