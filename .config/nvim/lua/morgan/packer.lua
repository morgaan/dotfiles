-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	-- Package manager
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
		requires = {'godlygeek/tabular'},
		ft = {'markdown', 'md'}
	}

	use {
		'mustache/vim-mustache-handlebars',
		ft = {'mustache', 'hbs'}
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},

			-- Neovim setup for init.lua and plugin development with full signature
			-- help, docs and completion for the nvim lua API.
			{'folke/neodev.nvim'}
		}
	}
  -- Buffer management
  -- -----------------

  use('tpope/vim-eunuch')

  -- UI/UX Extensions
  -- ----------------

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Vimwiki extension for telescope
  use('ElPiloto/telescope-vimwiki.nvim')

  -- Focused files manager/switcher
  use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }

  -- Theme
  use('ishan9299/nvim-solarized-lua')

  -- Highlight, edit, and navigate code
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  pcall(require('nvim-treesitter.install').update { with_sync = true })
	  end,
  }

  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('ThePrimeagen/git-worktree.nvim')

  use({
	  "iamcco/markdown-preview.nvim",
	  run = function() vim.fn["mkdp#util#install"]() end,
  })
  use('romainl/vim-cool')


  -- Extensions
  -- ----------

  use('tpope/vim-surround')
  use('tpope/vim-unimpaired')
  use('tpope/vim-commentary')
  use('tpope/vim-repeat')
  use('junegunn/vim-easy-align')

  -- Applications
  -- ------------

  use('vimwiki/vimwiki')
end)
