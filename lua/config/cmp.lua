-- Configuration for autocomplete

local cmp = require("cmp")

-- Limits the size of the popup for autocomplete to 10 entries
vim.o.pumheight = 10

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
			{ name = "nvim_lsp", },
			{ name = "luasnip" },
		},
		{
			{ name = "buffer" },
			{ name = "path" },
		}),
})
