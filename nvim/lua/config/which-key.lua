vim.o.timeout = true
vim.o.timeoutlen = 300

require("which-key").setup({
  win = {
    wo = {
      winblend = 0,
    }
  },
})

-- Set up highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none", blend = 0 })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
})
