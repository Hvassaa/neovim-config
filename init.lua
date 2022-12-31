require('rasmus.treesitter')
require('rasmus.colors')
require('rasmus.lsp')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.list = true
vim.opt.listchars = 'tab:» ,trail:-,extends:>,precedes:<,nbsp:+'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.o.backspace = 'indent,eol,start'
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.completeopt = 'menuone,noselect'
vim.o.breakindent = true
vim.wo.number = true
vim.cmd [[set completeopt-=preview]]

vim.keymap.set('n', '<F8>', ':setlocal spell! spelllang=en_gb<CR>') -- spelling!

vim.g.vimtex_complete_enabled = 1
-- vim.g.tex_flavor = 'latex'
-- vim.g.vimtex_view_general_viewer = 'evince'

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'numToStr/Comment.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'folke/which-key.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use 'hrsh7th/cmp-omni' -- works with vimtex!
  use 'lervag/vimtex'
end)
require('Comment').setup()
require('which-key').setup()
