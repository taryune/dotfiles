require("avante").setup({
  -- add any opts here
  -- for example
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  behaviour = {
    auto_suggestions = true,
  },
  providers = {
    copilot = {
      model = "claude-sonnet-4",
    },
    openrouter = {
      __inherited_from = "openai",
      endpoint = "https://openrouter.ai/api/v1",
      api_key_name = "OPENROUTER_API_KEY",
      model = "meta-llama/llama-4-maverick",
      max_tokens = 8192,
    }
  }
})
