local modes = {
  ["n"]  = "NORMAL",
  ["no"] = "NORMAL ",
  ["v"]  = "VISUAL ",
  ["V"]  = "V-LINE ",
  [""] = "V-BLOCK",
  ["s"]  = "SELECT",
  ["S"]  = "S-LINE",
  [""] = "S-BLOCK",
  ["i"]  = "INSERT",
  ["ic"] = "INSERT",
  ["R"]  = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["c"]  = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"]  = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"]  = "SHELL",
  ["t"]  = "TERMINAL",
  ["nt"] = "T-NORMAL"
}

vim.api.nvim_set_hl(0, "black_on_white", { bg="white", fg="black" })
vim.api.nvim_set_hl(0, "white_on_grey", { bg="grey", fg="white" })
vim.api.nvim_set_hl(0, "white_on_purple", { bg="purple", fg="white" })

local function get_mode ()
	 return modes[vim.api.nvim_get_mode().mode]
end

local function get_mode_color()
	 local mode = vim.api.nvim_get_mode().mode
	 if mode == "n" or mode == "nt" then
		return "%#white_on_grey#"
	else
		return "%#white_on_purple#"
	 end
end

function Get_statusline()
	return table.concat {
		get_mode_color(),
		" ",
		get_mode(),
		" ",
		"%#black_on_white#",
		" %t %m",
		"%=",
		"%Y %3l,%-3c %P ",
	}
end

vim.cmd("set noshowmode")
vim.o.statusline = "%!v:lua.Get_statusline()"
