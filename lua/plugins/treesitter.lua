return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		local config = require("nvim-treesitter")
		config.setup({
			install_dir = vim.fn.stdpath("data") .. "/site"
		})
		config.install({ "rust", "c", "cpp", "make" }):wait(300000)
	end
}
