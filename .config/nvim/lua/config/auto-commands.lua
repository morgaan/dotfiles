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
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	command = "let &shell='/bin/zsh -i'",
	group = vimenter_group,
	pattern = '*'
})

local netrw_mappings = vim.api.nvim_create_augroup('netrw_mappings', { clear = true })
vim.api.nvim_create_autocmd({ 'Filetype' }, {
	callback = function()
		vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<cr>', { buffer = true })
		vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<cr>', { buffer = true })
		vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<cr>', { buffer = true })
		vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<cr>', { buffer = true })
	end,
	group = netrw_mappings,
	pattern = 'netrw'
})

local changes_tracking = vim.api.nvim_create_augroup('ChangesTracking', { clear = true })
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
	command = 'silent! checktime',
	group = changes_tracking,
	pattern = '*'
})
vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
	command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
	group = changes_tracking,
	pattern = '*'
})

local on_resize = vim.api.nvim_create_augroup('OnVimResize', { clear = true })
vim.api.nvim_create_autocmd({ 'VimResized' }, {
	command = 'wincmd =',
	group = on_resize,
	pattern = '*'
})

-- Source: https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604#file-autocmds-lua-L26-L30
--
-- Open help in vertical split rather than annoying horizontal split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
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

-- Enables `preservim/vim-textobj-quote` plugin in Markdown files
vim.cmd([[
	augroup textobj_quote
		autocmd!
		autocmd FileType markdown call textobj#quote#init()
	augroup END
]])

-- Source: https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604#file-autocmds-lua-L70-L93
-- ide like highlight when stopping cursor
vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
	desc = "Highlight references under cursor in the whole file",
	callback = function()
		-- Only run if the cursor is not in insert mode
		if vim.fn.mode() ~= "i" then
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					break -- Found a supporting client, no need to check others
				end
			end

			-- 3. Proceed only if an LSP is active AND supports the feature
			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})

-- Source: https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604#file-autocmds-lua-L26-L30
--
-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})
