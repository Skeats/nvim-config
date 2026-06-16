require('config.options')
require('config.keybinds')
require('config.autocmd')
require('config.lazy')

vim.cmd("colorscheme gruvbox")

vim.lsp.enable('rust_analyzer')

