vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlights text when yaanking",
    group = vim.api.nvim_create_augroup("kickstart_highlight_yank", { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})
