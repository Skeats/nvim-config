return {
	-- Adds the ability to use gcc/<C-/> to comment or uncomment lines
	{
		'nvim-mini/mini.comment',
		version = false,
		config = function()
			require("mini.comment").setup()
		end
	},
	-- Adds a minimap to large files
	{
		'nvim-mini/mini.map',
		version = false,
		-- Lazy loaded so that the UI loads before we call minimap.open()
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local minimap = require("mini.map")
			minimap.setup({
				integration = {},
				window = {
					exclude_buftypes = { "terminal", "nofile", "quickfix", "prompt", "float" },
					exclude_filetypes = { "help", "NvimTree", "neo-tree", "dashboard", "alpha" },
				},
			})
			minimap.open()
		end
	},
	-- Allows for argument splitting
	{
		'nvim-mini/mini.splitjoin',
		version = false,
		config = function()
			require("mini.splitjoin").setup()
		end
	},
	-- Animates stuff
	{
		'nvim-mini/mini.animate',
		version = false,
		config = function()
			require("mini.animate").setup()
		end
	},
}
