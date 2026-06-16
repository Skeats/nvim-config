return {
	-- Adds git diffs in the gutters
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
		end
	},
	-- Adds git... lmao
	{
		"tpope/vim-fugitive"
	}
}
