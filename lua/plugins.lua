local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lervag/vimtex'
	use 'tpope/vim-commentary'
	use 'L3MON4D3/LuaSnip'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-omni' -- works with vimtex! 
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-cmdline'
	use 'mfussenegger/nvim-jdtls'
end)
