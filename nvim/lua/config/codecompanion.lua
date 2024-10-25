require("codecompanion").setup({
  display = {
    diff = {
      provider = "mini_diff",
    },
  },
  opts = {
    log_level = "DEBUG",
  },
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "copilot",
    },
    agent = {
      adapter = "ollama",
    },
  },
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        env = {
          url = "http://localhost:11434",
          api_key = "OLLAMA_API_KEY",
        },
        headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer ${api_key}",
        },
        parameters = {
          sync = true,
        },
        schema = {
          model = {
            default = "deepseek-coder-v2"
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = "cmd:op read op://private/OpenAI/credential --no-newline",
        },
        schema = {
          model = {
            default = "gpt-4o"
          },
        },
      })
    end,
  },
  prompt_library = {
    ["Code Expert"] = {
      strategy = "chat",
      description = "Get some special advice from an LLM",
      opts = {
        short_name = "expert",
        auto_submit = true,
        stop_context_insertion = true,
        user_prompt = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return "I want you to act as a senior "
                .. context.filetype
                .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
          end,
        },
        {
          role = "user",
          content = function(context)
            local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
          end,
          opts = {
            contains_code = true,
          }
        },
      },
    },
  },
})

local wk = require("which-key")

local key_map = {
  { "<leader>a",  group = "CodeCompanion" },
  mode = { "n", "v" },
  { "<leader>at", "<cmd>lua require('codecompanion').toggle()<CR>",         desc = "Toggle CodeCompanion" },
  { "<leader>ae", "<cmd>lua require('codecompanion').prompt('expert')<CR>", desc = "Start chat with an expert" },
  { "<leader>ac", "<cmd>lua require('codecompanion').chat()<CR>",           desc = "Start chat" },
  { "<leader>aa", "<cmd>lua require('codecompanion').add()<CR>",            desc = "Add" },
}
wk.add(key_map)
