local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

scnvim.setup({
  keymaps = {
    ['<M-e>'] = map('editor.send_line', { 'i', 'n' }),
    ['<C-e>'] = {
      map('editor.send_block', { 'i', 'n' }),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<M-L>'] = map('postwin.clear', { 'n', 'i' }),
    ['<C-k>'] = map('signature.show', { 'n', 'i' }),
    ['<F12>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
    ['<leader>st'] = map('sclang.start'),
    ['<leader>sp'] = map('sclang.stop'),
    ['<leader>sc'] = map('sclang.recompile'),
    ['<leader>sb'] = map_expr('s.boot'),
    ['<leader>sl'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
    },
  },
  postwin = {
    float = {
      enabled = true,
    },
  },
})
-- Load snippets for SuperCollider
--- require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
