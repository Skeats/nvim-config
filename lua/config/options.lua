local set = vim.opt

-- Line numbers
set.number = true
set.relativenumber = true

-- Indentation/Tabs
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true -- Automatically matches indentation when creating newlines

-- Search casing
set.ignorecase = true
set.smartcase = true

-- Colors
set.termguicolors = true
set.background = "dark"

-- Sign columns show things like Git Diffs and LSP diags
set.signcolumn = "yes:2"

set.cursorline = true
