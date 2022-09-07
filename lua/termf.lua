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

-- -- open a new or existing term in vertical split
-- local function open_or_switch_term ()
-- 	for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
-- 		local is_listed = vim.fn.buflisted(buffer) == 1
-- 		if is_listed then
-- 			local buf_type = vim.api.nvim_buf_get_option(buffer, "buftype")
-- 			if buf_type == "terminal" then
-- 				local win_id = vim.fn.bufwinid(vim.fn.bufname(buffer))
-- 				if win_id == -1 then
-- 					vim.cmd('vsplit')
-- 					local win = vim.api.nvim_get_current_win()
-- 					vim.api.nvim_win_set_buf(win, buffer)
-- 					print("Opened term")
-- 				else
-- 					vim.fn.win_gotoid(win_id)
-- 					print("Changed to term")
-- 				end
-- 				return 0
-- 			end
-- 		end
-- 	end
-- 	vim.cmd('vsplit')
-- 	local win = vim.api.nvim_get_current_win()
-- 	local buf = vim.api.nvim_create_buf(true, true)
-- 	vim.api.nvim_win_set_buf(win, buf)
-- 	vim.cmd("term")
-- 	print("Created new term")
-- 	return 0
-- end

-- local sterm_buf = -1

-- local function test ()
-- 	if sterm_buf == -1 then -- no sterm buffer exists -> create it and show it
-- 		vim.cmd('vsplit')
-- 		local win = vim.api.nvim_get_current_win()
-- 		local buf = vim.api.nvim_create_buf(true, true)
-- 		vim.api.nvim_win_set_buf(win, buf)
-- 		vim.cmd("term")
-- 		sterm_buf = buf
-- 		print("Created new term")
-- 		print(sterm_buf)
-- 		return 0
-- 	else -- sterm buffer exists
-- 		local win_id = vim.fn.bufwinid(vim.fn.bufname(sterm_buf))
-- 		if win_id == -1 then -- sterm buffer is not visible -> open new win for it
-- 			vim.cmd('vsplit')
-- 			local win = vim.api.nvim_get_current_win()
-- 			vim.api.nvim_win_set_buf(win, sterm_buf)
-- 		else -- sterm buffer is visible -> hide it
-- 			vim.api.nvim_win_hide(win_id)
-- 		end
-- 	end
-- end

vim.keymap.set({"t", "n"}, "<F5>", require("sterm").toggle, { silent=true })
