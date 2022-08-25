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
vim.cmd("highlight Pmenu ctermbg=NONE guibg=NONE") -- only really works when float/pop has borders
vim.cmd("highlight signcolumn ctermbg=NONE guibg=NONE")
