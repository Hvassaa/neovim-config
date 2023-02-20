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

require("rasmus.plugs")
require("rasmus.colors")
require("rasmus.treesitter")
require("rasmus.completion")
