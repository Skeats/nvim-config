-- Automatically adds closing brackets

return {
    {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter" },
	config = true,
    },
    {
	"windwp/nvim-ts-autotag",

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
    {
	"RRethy/nvim-treesitter-endwise"
    },
    {
	'nvim-mini/mini.surround',
	version = false,
	config = function()
		require("mini.surround").setup()
	end
    },
}
