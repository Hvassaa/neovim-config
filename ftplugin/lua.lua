vim.keymap.set("n", "<F4>", ":w<CR>:so %<cr>")
vim.keymap.set("n", "<F6>", ":!love .<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false
}
)
