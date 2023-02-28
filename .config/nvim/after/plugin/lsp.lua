require('neodev').setup()

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = '✘',
		warn = '▲',
		hint = '⚑',
		info = 'i'
	}
})

-- lsp.ensure_installed({
--   'tsserver',
--   'sumneko_lua'
-- })

lsp.on_attach(function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('[d', vim.diagnostic.goto_prev, 'Previous [D]iagnostic')
	nmap(']d', vim.diagnostic.goto_next, 'Next [D]iagnostic')
	nmap('<leader>vd', vim.diagnostic.open_float, '[V]iew [D]iagnostic')
	nmap('<leader>q', vim.diagnostic.setloclist, 'Buffer Diagnostics')

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end)

lsp.setup_nvim_cmp({
  sources = {
    {name = 'path'},
    {
		name = 'buffer',
		keyword_length = 3,
		get_bufnrs = function() return vim.api.nvim_list_bufs() end
	},
    {name = 'nvim_lsp'},
    {name = 'luasnip', keyword_length = 2},
  }
})

lsp.setup()
