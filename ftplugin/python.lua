local function run_pytest()
	vim.cmd("split")
	vim.cmd('exe "normal \\<C-W>L"')
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
	vim.fn.termopen("pytest")
end

vim.cmd("setlocal makeprg=python3\\ %")
vim.keymap.set("n", "<F4>", ":make<CR>")
vim.keymap.set("n", "<F6>", run_pytest)
