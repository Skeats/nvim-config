return {
	-- Automatically adds closing brackets, quotes, or spaces (when inside brackets)
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter" },
		config = true,
	},
	-- Automatically adds ending HTML tags
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				}
			})
		end
	},
	-- Automatically adds "end" tags to languages like Lua
	{
		"RRethy/nvim-treesitter-endwise"
	},
	-- Allows you to wrap selections with any character by using sa
	{
		'nvim-mini/mini.surround',
		version = false,
		config = function()
			require("mini.surround").setup()
		end
	},
}
