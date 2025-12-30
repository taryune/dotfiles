-- LSP setup (keymaps are in keymaps.lua)

-- Enable LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")
vim.lsp.enable("gopls")
-- vim.lsp.enable("hls")

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

-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    -- 2
    vim.api.nvim_create_autocmd("BufWritePre", {
      -- 3
      buffer = args.buf,
      callback = function()
        -- 4 + 5
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})
