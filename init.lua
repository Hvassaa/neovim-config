-- || GENERAL VIM CONF || --
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.tabstop = 4
vim.o.completeopt = 'menuone,noselect'
vim.opt.shiftwidth = 4
vim.wo.number = true
local keymap_opts = { silent = true }
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=en_gb<CR>", keymap_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- || PLUGINS || --
local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lervag/vimtex'
	use 'numToStr/Comment.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-omni' -- works with vimtex!
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	-- use 'mfussenegger/nvim-jdtls'
	use { 'Hvassaa/sterm.nvim', branch = "testing" }
	use 'Hvassaa/scomp.nvim'
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
			-- require("catppuccin").setup({ transparent_background = true })
			vim.api.nvim_command "colorscheme catppuccin"
		end
	}
end)
require('Comment').setup()

-- || LSP CONF || --
local on_attach = function(client, bufnr)
	local function formatx()
		vim.lsp.buf.format { async = true }
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', "<M-CR>", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', formatx, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- java is setup with nvim-jdtls in ftplugin/java.lua
local servers = { 'pyright', 'tsserver', 'rust_analyzer', }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- special LSP setup for sumneko_lua
lspconfig.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- nvim-cmp setup
local luasnip = require 'luasnip'
local cmp = require 'cmp'

-- why does sumneko_lua complain without nil check?
if cmp ~= nil then
	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = "omni" },
			{ name = "buffer", keyword_length = 4 },
			{ name = "path" },
		}),
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
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
end

-- || LaTeX / vimtex settings ||
vim.g.vimtex_complete_enabled = 1
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'evince'
-- set textwidth to 80 for "text" buffers
vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.tex", "*.md", "*.txt" },
	command = "setlocal textwidth=80"
})

-- || TERMINAL CONFIG || --
-- Double esc to get termimnal normal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true })

-- be able to change window in terminal mode
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>", { silent = true })

-- automatically go into terminal mode (insert)
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
	-- dont run when going from terminal mode to normal-terminal mode
	pattern = { "[^t]:nt" },
	-- wanted to use [^ct], otherwise you go into insert after entering command, but then :term wont go into insert :-(
	command = "startinsert"
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	-- dont run when going from terminal mode to normal-terminal mode
	pattern = { "*" },
	-- can this be done in lua/callback?
	command = "setlocal nonumber norelativenumber"
})

vim.keymap.set({ "t", "n" }, "<F5>", require("sterm").toggle, { silent = true })
