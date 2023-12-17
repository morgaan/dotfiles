-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup({function(use)
	-- Package manager (Packer can manage itself)
	use 'wbthomason/packer.nvim'

	-- Text objects
	-- ------------
	use('kana/vim-textobj-user')
	use('kana/vim-textobj-entire')
	use('kana/vim-textobj-line')
	use('michaeljsmith/vim-indent-object')
	use('whatyouhide/vim-textobj-xmlattr')
	use('jceb/vim-textobj-uri')
	use('wellle/targets.vim')

	-- Language support/syntax highlighting
	-- ------------------------------------
	use{
		'preservim/vim-markdown',
		requires = {'godlygeek/tabular'}
	}
	use {
		'mustache/vim-mustache-handlebars'
	}

	-- Completion
	use{
		'hrsh7th/nvim-cmp',
		requires = {
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{
				-- Snippets
				'saadparwaiz1/cmp_luasnip',
				requires = {
					{'L3MON4D3/LuaSnip'},
					{'rafamadriz/friendly-snippets'}
				}
			}
		}
	}

	-- Language Server Protocol (LSP)
	use('neovim/nvim-lspconfig')
	use {
		'williamboman/mason.nvim',
		run = ':MasonUpdate' -- :MasonUpdate updates registry contents
	}
	use('williamboman/mason-lspconfig.nvim')

	-- Buffer management
	-- -----------------

	use('tpope/vim-eunuch')

	-- UI/UX Extensions
	-- ----------------

	-- Theme
	use('ishan9299/nvim-solarized-lua')

	-- Telescope:
	-- Fuzzy anything (files, lsp, keymaps, commands, help...)
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	-- Vimwiki extension for telescope
	use('ElPiloto/telescope-vimwiki.nvim')
	-- node_modules search extension for telescope
	use('nvim-telescope/telescope-node-modules.nvim')
	use('princejoogie/dir-telescope.nvim')

	-- Search recursively with option to select per file type.
	-- :Ack! pattern --scss.
	use('mileszs/ack.vim')

	-- Disables search highlighting when you are done searching and re-enables
	-- it when you search again
	use('romainl/vim-cool')

	-- Git
	use('tpope/vim-fugitive')
	use('lewis6991/gitsigns.nvim')
	use{
		-- 'ThePrimeagen/git-worktree.nvim',
		'zkygr/git-worktree.nvim', -- This is needed until this PR: https://github.com/ThePrimeagen/git-worktree.nvim/pull/104 is merged
		commit = 'c8ff32c'
	}

	-- Focused files manager/switcher
	use {
		'ThePrimeagen/harpoon',
		requires = {'nvim-lua/plenary.nvim'}
	}

	-- Highlight, edit, and navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}

	-- Markdown file real-time preview
	use{
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn['mkdp#util#install']() end,
	}

	-- Extensions
	-- ----------

	use('tpope/vim-surround')
	use('tpope/vim-unimpaired')
	use('tpope/vim-commentary')
	use('tpope/vim-repeat')

	-- Applications
	-- ------------
	use('vimwiki/vimwiki')
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
