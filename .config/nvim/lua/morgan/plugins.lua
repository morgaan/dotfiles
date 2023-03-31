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

	-- UI/UX Extensions
	-- ----------------

	-- Theme
	use('ishan9299/nvim-solarized-lua')

	-- Git
	use('tpope/vim-fugitive')
	use('lewis6991/gitsigns.nvim')

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
