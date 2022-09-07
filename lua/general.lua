vim.opt.termguicolors = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse= "a"
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true
local keymap_opts = { silent = true }
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=en_gb<CR>", keymap_opts)
-- vim.keymap.set("n", "<F4>", ":w<CR>:so %<cr>", keymap_opts)
vim.api.nvim_set_hl(0, "signcolumn", { bg="NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg="white", bg="#4d4d4d" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg="black", bg="#C7B446" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg="NONE" })
