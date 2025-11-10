-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
-- local lspconfig_defaults = require("lspconfig").util.default_config
-- lspconfig_defaults.capabilities =
-- vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- lsp-zero
local lsp = require("lsp-zero")

-- don't add this function in the `LspAttach` event.
-- `format_on_save` should run only once.
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
    -- ["ltex"] = { "latex" },
  },
})
-- Lsp server settings
-- local lspconfig = require("lspconfig")
-- lspconfig.lua_ls.setup({})
-- lspconfig.nixd.setup({})
-- lspconfig.rust_analyzer.setup({})
-- lspconfig.ts_ls.setup({})
-- lspconfig.biome.setup({})
-- lspconfig.gopls.setup({})
-- lsp.use("solidity", {
-- cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
-- filetypes = { "solidity" },
-- root_dir = require("lspconfig.util").find_git_ancestor,
-- single_file_support = true,
-- })

vim.lsp.enable('lua_ls')
vim.lsp.enable('nixd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')
vim.lsp.enable('biome')
vim.lsp.enable('gopls')
vim.lsp.enable('solidity')
-- vim.lsp.enable('ltex')

-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting,
  },
})
