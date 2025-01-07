vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.wo.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.cmd("colorscheme retrobox")

do
  local lazy_path = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  local initialized = vim.uv.fs_stat(lazy_path)

  if not initialized then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path})
  end

  vim.opt.rtp:prepend(lazy_path)
end

do
  local lsp = {"neovim/nvim-lspconfig"}
  local telescope = {"nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = {"nvim-lua/plenary.nvim"}}

  local treesitter = {
	  "nvim-treesitter/nvim-treesitter", 
	  build = ":TSUpdate", 
	  config = function()
		  local ts = require("nvim-treesitter.configs")
		  return ts.setup({
			  auto_install = true, 
			  highlight = {
				  enable = true, 
				  additional_vim_regex_highlighting = false
			  }, 
			  sync_install = false
		  })
	  end
  }

  local blink = {
	  "saghen/blink.cmp", 
	  dependencies = {"rafamadriz/friendly-snippets"}, 
	  version = "v0.8.2", 
	  opts = {
		  keymap = {preset = "enter"}, 
		  sources = {cmdline = {}}, 
		  appearance = {
			  use_nvim_cmp_as_default = true, 
			  nerd_font_variant = "mono"
		  }, 
		  completion = {
			  documentation = {
				  auto_show = true, 
				  auto_show_delay_ms = 100
			  }
		  }, 
		  signature = {enabled = true}
	  }
  }

  local lazy = require("lazy")
  lazy.setup({treesitter, lsp, telescope, blink})
end

do
  local lsp = require("lspconfig")
  local blink = require("blink.cmp")
  local capabilities blink.get_lsp_capabilities()

  lsp.rust_analyzer.setup({capabilities = capabilities})
end

do
	local telescope = require("telescope.builtin")
	local normal_maps = {
		{"<F6>", vim.lsp.buf.rename}, 
		{"gd", vim.lsp.buf.definition}, 
		{"<leader>ca", vim.lsp.buf.code_action}, 
		{"<leader>r", vim.lsp.buf.references}, 
		{"<leader>ff", telescope.find_files}, 
		{"<leader>fg", telescope.live_grep}, 
		{"<leader>fs", telescope.treesitter}
	}

	for _, mapping in pairs(normal_maps) do
		local key = mapping[1]
		local action = mapping[2]
		vim.keymap.set("n", key, action)
	end
end
