vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

local chat_gpt = {
  { "<leader>l",  group = "ChatGPT" },
  { "<leader>lc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
  {
    mode = { "n", "v" },
    { "<leader>la", "<cmd>ChatGPTRun add_tests<CR>",                 desc = "Add Tests" },
    { "<leader>ld", "<cmd>ChatGPTRun docstring<CR>",                 desc = "Docstring" },
    { "<leader>le", "<cmd>ChatGPTEditWithInstruction<CR>",           desc = "Edit with instruction" },
    { "<leader>lf", "<cmd>ChatGPTRun fix_bugs<CR>",                  desc = "Fix Bugs" },
    { "<leader>lg", "<cmd>ChatGPTRun grammar_correction<CR>",        desc = "Grammar Correction" },
    { "<leader>lk", "<cmd>ChatGPTRun keywords<CR>",                  desc = "Keywords" },
    { "<leader>ll", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
    { "<leader>lo", "<cmd>ChatGPTRun optimize_code<CR>",             desc = "Optimize Code" },
    { "<leader>lr", "<cmd>ChatGPTRun roxygen_edit<CR>",              desc = "Roxygen Edit" },
    { "<leader>ls", "<cmd>ChatGPTRun summarize<CR>",                 desc = "Summarize" },
    { "<leader>lt", "<cmd>ChatGPTRun translate<CR>",                 desc = "Translate" },
    { "<leader>lx", "<cmd>ChatGPTRun explain_code<CR>",              desc = "Explain Code" },
  },
}

wk.add(chat_gpt)
