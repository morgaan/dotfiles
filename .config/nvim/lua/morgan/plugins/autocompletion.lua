return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
		{
			-- https://github.com/folke/lazydev.nvim
			-- Make lua_ls aware of vim globals... and therefore support
			-- autocompletion experience when authoring vim configuration
			'folke/lazydev.nvim',
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				}
			}
		}
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		luasnip.filetype_extend("javascript", { "jsdoc" })
		require('luasnip.loaders.from_vscode').lazy_load()

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c', }),
				['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<c-e>'] = cmp.mapping.abort(),
				['<c-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
						-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { 'i', 's' }),

				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),

				['<c-n>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif hasPriorWords() then
						cmp.complete()
					else
						fallback()
					end
				end, { 'i', 's' }),

				['<c-p>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					end
				end, { 'i', 's' }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'path' },
			}, {
				{ name = 'buffer', option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end }},
			})
		})
	end,
	opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end
}
