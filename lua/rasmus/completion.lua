local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.setup_nvim_cmp({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'omni', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  }
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
