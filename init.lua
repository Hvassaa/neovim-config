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

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
end)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'tsserver', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- nvim-cmp setup
local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "omni" }, 
		{ name = "buffer", keyword_length = 4 },
		{ name = "path" },
	}),
	 mapping = cmp.mapping.preset.insert({
		 ["<C-d>"] = cmp.mapping.scroll_docs(-4),
		 ["<C-f>"] = cmp.mapping.scroll_docs(4),
		 ['<c-y>'] = cmp.mapping.confirm {
			 behavior = cmp.ConfirmBehavior.Replace,
			 select = true,
		},
	}),
	view = {
		entries = "custom",
	},
	experimental = {
		ghost_text = true,
	},
}
vim.cmd("highlight Pmenu ctermbg=gray guibg=gray")

-- LaTeX / vimtex settings
vim.g.vimtex_complete_enabled = 1
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'evince'
vim.cmd[[
	autocmd FileType tex autocmd VimLeave * :VimtexClean
	autocmd FileType tex,md setlocal textwidth=80
]]
