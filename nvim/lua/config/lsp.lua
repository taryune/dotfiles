-- LSP setup (keymaps are in keymaps.lua)

-- lsp-zero format on save
local lsp = require("lsp-zero")

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"] = { "lua" },
    ["nixd"] = { "nix" },
    ["biome"] = { "javascript", "typescript" },
    ["rust_analyzer"] = { "rust" },
    ["gopls"] = { "go" },
    ["hls"] = { "haskell", "lhaskell", "cabal" },
  },
})

-- Enable LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")
vim.lsp.enable("gopls")

-- Haskell: managed by haskell-tools.nvim (see plugins/language.lua)

-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
  },
})

-- Attach lsp_signature on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspSignature", {}),
  callback = function(ev)
    -- Attach lsp_signature only for filetypes that support signature help
    if vim.bo[ev.buf].filetype ~= "cabal" then
      require("lsp_signature").on_attach({}, ev.buf)
    end
  end,
})
