vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent=true }  ) -- Double esc to get termimnal normal
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w>", { silent=true }) -- be able to change window in terminal mode
-- automatically go into terminal mode (insert)
vim.api.nvim_create_autocmd({ "ModeChanged" }, {
	pattern = { "[^t]:nt" }, -- dont run when going from terminal mode to normal-terminal mode 
	-- wanted to use [^ct], otherwise you go into insert after entering command, but then :term wont go into insert :-(
	command = "startinsert"
})
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = { "*" }, -- dont run when going from terminal mode to normal-terminal mode
	command = "setlocal nonumber norelativenumber" -- can this be done in lua/callback?
})
