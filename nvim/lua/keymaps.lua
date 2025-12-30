-- Centralized keymaps with which-key
local wk = require("which-key")

-- Basic keymaps (non-which-key)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable F1
map("n", "<F1>", "<Nop>", opts)

-- j/k for logical line navigation
map("n", "j", "+", { noremap = true, desc = "Next line (logical)" })
map("n", "k", "-", { noremap = true, desc = "Prev line (logical)" })
map("n", "J", "j", { noremap = true, desc = "Next line (actual)" })
map("n", "K", "k", { noremap = true, desc = "Prev line (actual)" })

-- Tmux navigator
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Window right" })

-- Close buffer
map("n", "qq", ":bd<CR>", { noremap = true, desc = "Close buffer" })

-- Which-key mappings
wk.add({
  -- s = Splits/Tabs
  { "s",          group = "splits/tabs" },
  { "sj",         "<C-w>j",                                  desc = "Window down" },
  { "sk",         "<C-w>k",                                  desc = "Window up" },
  { "sl",         "<C-w>l",                                  desc = "Window right" },
  { "sh",         "<C-w>h",                                  desc = "Window left" },
  { "sv",         ":<C-u>vs<CR>",                            desc = "Vertical split" },
  { "sO",         "<C-w>=",                                  desc = "Equalize windows" },
  { "st",         ":<C-u>tabnew<CR>",                        desc = "New tab" },
  { "sn",         "gt",                                      desc = "Next tab" },
  { "sp",         "gT",                                      desc = "Prev tab" },

  -- Window resize
  { "+",          ":vertical resize +10<CR>",                desc = "Increase width" },
  { "_",          ":vertical resize -10<CR>",                desc = "Decrease width" },

  -- Oil
  { "-",          "<cmd>Oil<cr>",                            desc = "Open parent directory (Oil)" },

  -- <leader>f = Find (FZF)
  { "<leader>f",  group = "find" },
  { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
  { "<leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>",  desc = "Grep" },
  { "<leader>fl", "<cmd>Yazi toggle<CR>",                    desc = "Browse Files" },

  -- <leader>r = Replace
  { "<leader>r",  group = "replace" },
  {
    "<leader>r",
    'yiw:%s/<C-r><C-r>"//g<Left><Left>',
    desc = "Replace word under cursor",
    mode = "n",
  },
  {
    "<leader>r",
    'y:%s/<C-r><C-r>"//g<Left><Left>',
    desc = "Replace selection",
    mode = "x",
  },

  -- <leader>l = LSP
  { "<leader>l",  group = "LSP" },
  { "<leader>le", vim.diagnostic.open_float,              desc = "Open diagnostic float" },
  { "<leader>lq", vim.diagnostic.setloclist,              desc = "Diagnostic loclist" },

  -- <leader>g = Git
  { "<leader>g",  group = "git" },
  { "<leader>gb", "<cmd>GitBlameToggle<cr>",              desc = "Toggle git blame" },
  { "<leader>gg", "<cmd>Neogit kind=split_below_all<cr>", desc = "Show Neogit UI" },


  -- <leader>c = Comments (NERDCommenter)
  { "<leader>c",  group = "comments" },

  -- <leader>s = SuperCollider
  { "<leader>s",  group = "supercollider" },

  -- <leader>t = Tabs
  { "<leader>t",  group = "tabs" },
  { "<leader>tn", "gt",                                   desc = "Next tab" },
  { "<leader>tp", "gT",                                   desc = "Prev tab" },
  { "<leader>tt", ":<C-u>tabnew<CR>",                     desc = "New tab" },
})

-- Diagnostic navigation (outside which-key for [ and ] prefixes)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- LSP keymaps (set up on LspAttach)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
  callback = function(ev)
    local bufopts = { buffer = ev.buf }

    -- LSP buffer-local keymaps via which-key
    wk.add({
      { "K",          vim.lsp.buf.hover,           desc = "Hover",            buffer = ev.buf },

      -- <leader>l = LSP (buffer local additions)
      { "<leader>ld", vim.lsp.buf.definition,      desc = "Go to definition", buffer = ev.buf },
      { "<leader>lD", vim.lsp.buf.type_definition, desc = "Type definition",  buffer = ev.buf },
      { "<leader>lr", vim.lsp.buf.references,      desc = "References",       buffer = ev.buf },
      { "<leader>ln", vim.lsp.buf.rename,          desc = "Rename",           buffer = ev.buf },
      {
        "<leader>la",
        vim.lsp.buf.code_action,
        desc = "Code action",
        buffer = ev.buf,
        mode = { "n", "v" },
      },
      {
        "<leader>lf",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        desc = "Format",
        buffer = ev.buf,
      },
      { "<leader>lh",  vim.lsp.buf.hover,                   desc = "Hover",                   buffer = ev.buf },
      { "<leader>ls",  vim.lsp.buf.signature_help,          desc = "Signature help",          buffer = ev.buf },

      -- Workspace
      { "<leader>lw",  group = "workspace",                 buffer = ev.buf },
      { "<leader>lwa", vim.lsp.buf.add_workspace_folder,    desc = "Add workspace folder",    buffer = ev.buf },
      { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder", buffer = ev.buf },
      {
        "<leader>lwl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "List workspace folders",
        buffer = ev.buf,
      },
    })

    -- Also set <C-k> for signature help (standard LSP binding)
    map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  end,
})

-- Haskell keymaps (haskell-tools.nvim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "haskell", "lhaskell", "cabal" },
  group = vim.api.nvim_create_augroup("UserHaskellKeymaps", {}),
  callback = function(ev)
    local ht = require("haskell-tools")

    wk.add({
      -- <leader>h = Haskell
      { "<leader>h",   group = "haskell",             buffer = ev.buf },

      -- LSP extensions (under <leader>l for consistency)
      { "<leader>lc",  vim.lsp.codelens.run,          desc = "Run codelens",              buffer = ev.buf },
      { "<leader>lC",  vim.lsp.codelens.refresh,      desc = "Refresh codelens",          buffer = ev.buf },

      -- Hoogle
      { "<leader>hs",  ht.hoogle.hoogle_signature,    desc = "Hoogle signature",          buffer = ev.buf },
      { "<leader>hh",  "<cmd>Telescope hoogle<cr>",   desc = "Hoogle search (Telescope)", buffer = ev.buf },
      -- Eval
      { "<leader>he",  ht.lsp.buf_eval_all,           desc = "Eval all snippets",         buffer = ev.buf },

      -- REPL
      { "<leader>hr",  ht.repl.toggle,                desc = "Toggle REPL",               buffer = ev.buf },
      { "<leader>hq",  ht.repl.quit,                  desc = "Quit REPL",                 buffer = ev.buf },

      -- Project files
      { "<leader>hp",  group = "project",             buffer = ev.buf },
      { "<leader>hpc", ht.project.open_package_cabal, desc = "Open .cabal file",          buffer = ev.buf },
      { "<leader>hpy", ht.project.open_package_yaml,  desc = "Open package.yaml",         buffer = ev.buf },
      { "<leader>hpp", ht.project.open_project_file,  desc = "Open project file",         buffer = ev.buf },
    })
  end,
})

-- Haskell REPL terminal keymaps
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("UserHaskellReplKeymaps", {}),
  callback = function(ev)
    -- Exit terminal mode with Esc
    map("t", "<Esc>", [[<C-\><C-n>]], { buffer = ev.buf, desc = "Exit terminal mode" })

    -- Check if this is a ghci/cabal repl terminal
    local bufname = vim.api.nvim_buf_get_name(ev.buf)
    if bufname:match("ghci") or bufname:match("cabal") then
      local ht = require("haskell-tools")
      map("t", "<C-r>", function()
        ht.repl.reload()
      end, { buffer = ev.buf, desc = "Reload REPL" })

      -- Move REPL to bottom horizontal split and resize
      vim.cmd("wincmd J")
      vim.cmd("resize 15")
    end
  end,
})
