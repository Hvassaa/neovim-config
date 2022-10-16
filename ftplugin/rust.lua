local scomp = require("scomp")
scomp.setup({
	command = function()
		return "rustc -o a " .. vim.fn.expand("%") .. " && ./a"
	end
})

vim.keymap.set("n", "<F6>", scomp.run)
vim.keymap.set("n", "<F7>", scomp.reset_data)
