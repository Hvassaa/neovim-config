vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd.highlight {"Normal", "guibg=NONE"}

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.pack.add {
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.completion"
}


vim.lsp.enable {
  "lua_ls"
}

require("vim._core.ui2").enable()
require("mini.completion").setup()
