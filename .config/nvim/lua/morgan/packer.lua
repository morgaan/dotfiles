-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use('kana/vim-textobj-user')
  use('kana/vim-textobj-entire')
  use('kana/vim-textobj-line')
  use('michaeljsmith/vim-indent-object')
  use('whatyouhide/vim-textobj-xmlattr')
  use('jceb/vim-textobj-uri')
  use('wellle/targets.vim')
  use('ishan9299/nvim-solarized-lua')
  use('tpope/vim-fugitive')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('tpope/vim-surround')
  use('tpope/vim-unimpaired')
  use('tpope/vim-commentary')
end)
