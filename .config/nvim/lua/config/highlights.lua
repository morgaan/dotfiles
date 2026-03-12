local hl = function(group, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, group, opts)
end

hl('InYourFacePink', {bold=true, bg='magenta', fg='white'})

hl('MyMarkdownH1', {bold=true, fg='#e78284'})
hl('MyMarkdownH2', {bold=true, fg='#ef9f76'})
hl('MyMarkdownH3', {bold=true, fg='#e5c890'})
hl('MyMarkdownH4', {bold=true, fg='#a6d189'})
hl('MyMarkdownH5', {bold=true, fg='#99d1db'})
hl('MyMarkdownH6', {bold=true, fg='#babbf1'})

-- Italicised comments and attributes.
hl('Comment', {italic=true, fg='#5f87df'})
hl('htmlArg', {italic=true, fg='#af8700'})

-- Status line highlights
hl('StatuslineFilename', {bold=true, fg='#b58900'})
hl('StatuslineCustom', {fg='#D9D9D9', bg='#565656'})

-- More contrasted CursorLineNr, Cursor and ColorColumn
-- Could go for the `hl()` way, so fall back to old way
-- https://stackoverflow.com/a/79220071
vim.o.cursorline = true
-- Could not make it work with hl()!
vim.cmd([[
  highlight CursorLineNr gui=bold guifg=#e5c890 guibg=#565656
  highlight CursorColumn guifg=#D9D9D9
]])

-- More contrasted Visual selection
hl('Visual', {reverse=false, bg='#B58900', fg='#073642'})

-- Fix highlights issues with Telescope
hl('TelescopeSelection', {fg='#D9D9D9', bg='#565656'})
hl('TelescopeMatching', {link='InYourFacePink'})

