-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
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
  use{
	  'mustache/vim-mustache-handlebars',
	  ft = {'mustache', 'hbs'}
  }
  
-- Syntax checkers/linters
-- -----------------------

  use('editorconfig/editorconfig-vim')

-- Buffer management
-- -----------------

  use('tpope/vim-eunuch')

-- UI/UX Extensions
-- ----------------

  use('ishan9299/nvim-solarized-lua')
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('tpope/vim-fugitive')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

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
