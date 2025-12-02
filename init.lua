vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = "menu,menuone,noinsert,noselect"

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format()
        end
      })
    end
  end
})

vim.lsp.config('*', { root_markers = { '.git' }})
vim.diagnostic.config({ virtual_text = true })
vim.lsp.enable({"rust_analyzer"})

require('mini.completion').setup()
