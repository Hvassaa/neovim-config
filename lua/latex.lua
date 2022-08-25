-- LaTeX / vimtex settings
vim.g.vimtex_complete_enabled = 1
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'evince'
--vim.cmd[[
	--autocmd FileType tex autocmd VimLeave * :VimtexClean
	--autocmd FileType tex,md setlocal textwidth=80
--]]

vim.cmd[[
	autocmd BufEnter *.tex autocmd VimLeave * :VimtexClean
	autocmd BufEnter *.tex,*.md setlocal textwidth=80
]]
