-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set backspace behavior
vim.o.backspace = "indent,eol,start"

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set clipboard options
vim.o.clipboard = "unnamedplus"

-- Enable cursor line
vim.wo.cursorline = true

-- Enable mouse support
vim.o.mouse = "a"

-- Set auto reload
vim.o.autoread = true
vim.cmd([[
  au CursorHold * checktime
]])

-- Set conceal options
vim.g.tex_conceal = ""
vim.g.indentLine_setConceal = 0

-- Set tab settings
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2

-- Reserve a space in the gutter (for LSP signs)
vim.opt.signcolumn = "yes"

-- Timeout for which-key
vim.o.timeout = true
vim.o.timeoutlen = 300
