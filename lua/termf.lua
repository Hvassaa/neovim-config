-- Double esc to get termimnal normal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent=true })

-- be able to change window in terminal mode
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>", { silent=true })

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

vim.keymap.set({"t", "n"}, "<F5>", require("sterm").toggle, { silent=true })
