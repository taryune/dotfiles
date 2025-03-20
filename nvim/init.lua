-- Set backspace behavior
vim.o.backspace = "indent,eol,start"

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable line numbers
vim.wo.number = true

-- Set clipboard options
vim.o.clipboard = "unnamedplus"

-- Enable cursor line
vim.wo.cursorline = true

-- Enable mouse support
vim.o.mouse = "a"

-- Set auto reload
vim.o.autoread = true
vim.cmd [[
  au CursorHold * checktime
]]

-- Set conceal options
vim.g.tex_conceal = ''
vim.g.indentLine_setConceal = 0

-- Set tab settings
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2

-- Mappings
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', {})
vim.api.nvim_set_keymap('n', 'k', '-', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', '+', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'j', { noremap = true })

-- Split mappings
vim.api.nvim_set_keymap('n', 's', '<Nop>', {})
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', 'sv', ':<C-u>vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sO', '<C-w>=', { noremap = true })
vim.api.nvim_set_keymap('n', '+', ':vertical resize +10<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '_', ':vertical resize -10<CR>', { noremap = true })

-- Tab mappings
vim.api.nvim_set_keymap('n', 'st', ':<C-u>tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sn', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', 'gT', { noremap = true })

-- Remap
vim.api.nvim_set_keymap('x', '<leader>r', 'y:%s/<C-r><C-r>"//g<Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', 'yiw:%s/<C-r><C-r>"//g<Left><Left>', { noremap = true })


-- close buffers
vim.api.nvim_set_keymap('n', 'qq', ':bd<CR>', { noremap = true })

-- lazy.nvim
require('lazy_nvim')
