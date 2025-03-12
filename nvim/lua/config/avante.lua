require("avante").setup({
  -- add any opts here
  -- for example
  provider = "copilot",
  auto_suggestions_provider = 'copilot',
  behaviour = {
    auto_suggestions = true,
  },
  copilot = {
    model = "claude-3.7-sonnet",
  },
})
