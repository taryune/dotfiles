require("CopilotChat").setup({
  chat_autocomplete = false,

  mappings = {
    complete = {
      insert = '<Tab>',
    },
  },
})

local wk = require("which-key")

local key_map = {
  { "<leader>cc",  group = "CopilotChat" },
  mode = { "n", "v" },
  { "<leader>ccc", ":CopilotChat<cr>",             desc = "CopilotChat - Prompt" },
  { "<leader>cce", ":CopilotChatExplain<cr>",      desc = "CopilotChat - Explain code" },
  { "<leader>cct", "<cmd>CopilotChatTests<cr>",    desc = "CopilotChat - Generate tests" },
  { "<leader>ccr", "<cmd>CopilotChatReview<cr>",   desc = "CopilotChat - Review code" },
  { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
}
wk.add(key_map)
