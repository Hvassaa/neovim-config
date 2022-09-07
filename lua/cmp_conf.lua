-- nvim-cmp setup
local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "omni" },
		{ name = "buffer", keyword_length = 4 },
		{ name = "path" },
	}),
	 mapping = cmp.mapping.preset.insert({
		 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
		 ["<C-f>"] = cmp.mapping.scroll_docs(4),
		 ['<c-y>'] = cmp.mapping.confirm {
			 behavior = cmp.ConfirmBehavior.Replace,
			 select = true,
		},
	}),
	view = {
		entries = "custom",
	},
	experimental = {
		ghost_text = true,
	},
	-- window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- },
}

-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline', keyword_length = 3 }
--   })
-- })

-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- vim.api.nvim_set_keymap('c', '<C-y>', '', {
--     callback = function()
--         cmp.confirm({ select = false })
--     end,
-- })
