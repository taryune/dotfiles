-- Local LLM
local config = {
  api_host_cmd = "echo -n http://localhost:11434",
  api_key_cmd = "echo ollama",
}

require("chatgpt").setup(config)
