-- none-ls setup for external formatters and linters
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Register forge fmt as a formatter for Solidity
    null_ls.builtins.formatting.forge_fmt,
  },
})
