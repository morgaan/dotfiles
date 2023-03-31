-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	-- Package manager (Packer can manage itself)
	use 'wbthomason/packer.nvim'
end)
