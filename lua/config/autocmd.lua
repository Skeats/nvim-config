vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlights text when yanking",
    group = vim.api.nvim_create_augroup("kickstart_highlight_yank", { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

