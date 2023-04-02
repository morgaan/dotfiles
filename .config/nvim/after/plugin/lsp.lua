local mason_lspconfig = require('mason-lspconfig')

require('mason').setup({
	-- May need to have `gh` cli install and to run `gh auth login -w`
	-- Figured that out thanks to https://github.com/williamboman/mason.nvim/issues/828
    registries = {
        'github:mason-org/mason-registry',
        'lua:mason-registry.index'
    }
})

mason_lspconfig.setup({
	ensure_installed = { 'lua_ls' }
})

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	nmap('[d', vim.diagnostic.goto_prev, 'Previous [D]iagnostic')
	nmap(']d', vim.diagnostic.goto_next, 'Next [D]iagnostic')
	nmap('<leader>vd', vim.diagnostic.open_float, '[V]iew [D]iagnostic')
	nmap('<leader>q', vim.diagnostic.setloclist, 'Buffer Diagnostics')

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [T]ype definition')
	nmap('gt', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'LSP: Format current buffer with LSP' })
end

local settings = {
	lua_ls = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'}
			}
		}
	}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
	function (server)
		require('lspconfig')[server].setup {
			settings = settings[server] ~= nil and settings[server] or nil,
			on_attach = on_attach,
			capabilities = capabilities
		}
	end
}

local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "i" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

