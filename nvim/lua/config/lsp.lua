-- LSP setup (keymaps are in keymaps.lua)

-- Enable LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")
vim.lsp.enable("gopls")
vim.lsp.enable('solidity_ls')
vim.lsp.enable('guile_ls')
vim.lsp.enable('ruff')
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
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        -- Use unified LSP formatting (none-ls provides forge fmt for Solidity)
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})
