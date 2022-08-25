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
vim.keymap.set("n", "<F8>", ":setlocal spell! spelllang=en_gb<CR>")
vim.api.nvim_set_hl(0, "signcolumn", { ctermbg=NONE, guibg=NONE })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg=NONE, guibg=NONE })
vim.api.nvim_set_hl(0, "WinSeparator", { ctermbg=NONE, guibg=NONE })
