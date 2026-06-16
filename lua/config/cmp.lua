-- Configuration for autocomplete

local cmp = require("cmp")

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
			{ name = "nvim-lsp" },
			{ name = "luasnip" },
		},
		{
			{ name = "buffer" },
			{ name = "path" },
		}),
	get_trigger_characters = function(trigger_characters)
		vim.list_extend(trigger_characters, { ".", ":" })
		return trigger_characters
	end
})
