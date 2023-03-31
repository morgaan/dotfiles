-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
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
		requires = {'godlygeek/tabular'},
		ft = {'markdown', 'md'}
	}

	use {
		'mustache/vim-mustache-handlebars',
		ft = {'mustache', 'hbs'}
	}

	-- Buffer management
	-- -----------------

	use('tpope/vim-eunuch')

	-- UI/UX Extensions
	-- ----------------

	-- Theme
	use('ishan9299/nvim-solarized-lua')

	-- Search recursively with option to select per file type.
	-- :Ack! pattern --scss.
	use('mileszs/ack.vim')

	-- Disables search highlighting when you are done searching and re-enables
	-- it when you search again
	use('romainl/vim-cool')

	-- Git
	use('tpope/vim-fugitive')
	use('lewis6991/gitsigns.nvim')

	-- Focused files manager/switcher
	use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }

	-- Highlight, edit, and navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}

	-- Markdown file real-time preview
	use({
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn['mkdp#util#install']() end,
	})

	-- Extensions
	-- ----------

	use('tpope/vim-surround')
	use('tpope/vim-unimpaired')
	use('tpope/vim-commentary')
	use('tpope/vim-repeat')

	-- Applications
	-- ------------
	use('vimwiki/vimwiki')
end)
