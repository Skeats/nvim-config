vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "<leader>cd", vim.cmd.Ex)
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "<leader>a", "ggVG")

set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
set("n", "<leader>bd", ":bdelete<CR>")
