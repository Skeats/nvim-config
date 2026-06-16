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
	},
	{
		'isakbm/gitgraph.nvim',
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = 'M',
				commit = '*',
			},
			format = {
				timestamp = '%H:%M:%S %d-%m-%Y',
				fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
			},
			hooks = {
				on_select_commit = function(commit)
					print('selected commit:', commit.hash)
				end,
				on_select_range_commit = function(from, to)
					print('selected range:', from.hash, to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gl",
				function()
					require('gitgraph').draw({}, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},
}
