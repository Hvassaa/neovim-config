vim.loader.enable()
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.wo.number = true
vim.cmd[[colorscheme retrobox]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{"neovim/nvim-lspconfig"},
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
		config = function () 
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				}
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp-signature-help"
		},
		config = function () 
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" }
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-i>"] = cmp.mapping.open_docs(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4)
				})
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
})

vim.keymap.set('n', '<F6>', vim.lsp.buf.rename)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
-- vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_workspace_symbols)
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').treesitter)

local lsp = require("lspconfig")
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.gopls.setup({
	-- cmd = {'gopls'},
	-- capabilities = capabilities
})

lsp.rust_analyzer.setup({})
