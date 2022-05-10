vim.g.nocompatible = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.wo.number = true
vim.opt.mouse= "a"
vim.g.nowrap = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.cmd("highlight WinSeparator guibg=None")
vim.cmd('filetype plugin indent on')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.cmd("autocmd CompleteDone * pclose")
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=en_gb<CR>")

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
vim.call('plug#end')

-- LSP
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
require('lspconfig').pyright.setup{ on_attach = on_attach }
require('lspconfig').vimls.setup{ on_attach = on_attach }
require('lspconfig').clangd.setup{ on_attach = on_attach }

-- LaTeX / vimtex settings
vim.g.vimtex_complete_enabled = 1
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'evince'
vim.cmd[[
	autocmd FileType tex autocmd VimLeave * :VimtexClean
	autocmd FileType tex,md setlocal textwidth=80
]]
