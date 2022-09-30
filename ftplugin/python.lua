local prev_test = ""
local function run_pytest()
	local test = vim.fn.input({
		prompt = "Test to run (Empty for all): ",
		default = prev_test,
		completion = "file"
	})
	prev_test = test
	vim.cmd("split")
	vim.cmd('exe "normal \\<C-W>L"')
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
	vim.fn.termopen("python3 -m pytest " .. test)
end

-- vim.cmd("setlocal makeprg=python3\\ %")
-- vim.keymap.set("n", "<F4>", ":make<CR>")
vim.keymap.set("n", "<F4>", ":!python3 %<CR>")
vim.keymap.set("n", "<F6>", run_pytest)
