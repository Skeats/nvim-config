local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "Highlights text when yanking",
    group = vim.api.nvim_create_augroup("kickstart_highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd({ "FocusLost", "WinLeave" }, {
    callback = function()
        vim.opt.cursorline = false
    end
})

autocmd({ "FocusGained", "WinEnter" }, {
    callback = function()
        vim.opt.cursorline = true
    end
})
