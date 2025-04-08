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
vim.o.background = "light"
vim.cmd("colorscheme retrobox")
vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE")
vim.cmd("hi FloatBorder guibg=NONE")
vim.cmd("hi Pmenu guibg=NONE")
vim.o.winborder = "rounded"

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
	  dependencies = { "rafamadriz/friendly-snippets" }, 
	  version = "v1.0.0", 
	  opts = {
		  keymap = { preset = "enter" }, 
		  appearance = {
			  use_nvim_cmp_as_default = true, 
			  nerd_font_variant = "mono",
		  }, 
		  signature = { 
			  enabled = true,
			  window = { show_documentation = false }
		  },
		  completion = {
			  menu = {
				  draw = {
					  columns = { { "label", "label_description" }, { "kind" } },
				  }
			  },
			  documentation = { auto_show = true, auto_show_delay_ms = 100 },
		  }
	  }
  }

  local fzf_lua = { "ibhagwan/fzf-lua", opts = {} }

  require("lazy").setup({ 
	  ui = { border = "rounded" },
	  spec = {
		  treesitter, 
		  blink, 
		  fzf_lua,
	  }
  })
end

do
  vim.diagnostic.config({ virtual_text = true })

  local on_attach = function(args)
	  local client = vim.lsp.get_client_by_id(args.data.client_id)
	  -- Format the current buffer on save
	  if client:supports_method('textDocument/formatting') then
		  vim.lsp.buf.format({bufnr = args.buf, id = client.id})
	  end
  end
  vim.api.nvim_create_autocmd("LspAttach", {callback = on_attach})

  vim.lsp.config('*', {
	  root_markers = { '.git' },
  })

  vim.lsp.config.gopls = {
	  cmd = { vim.fn.expand("$HOME/go/bin/gopls") },
	  filetypes = { "go", "gomod", "gowork", "gotmpl" },
	  root_markers = { "go.mod", "go.sum", ".git", vim.uv.cwd() },
  }
  vim.lsp.enable({ "gopls" })
end
