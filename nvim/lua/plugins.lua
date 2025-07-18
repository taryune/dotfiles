return {
  -- colorscheme
  {
    "EdenEast/nightfox.nvim"
    ,
    name = "nightfox",
    config = function()
      -- vim.cmd("colorscheme carbonfox")
    end
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.cmd("colorscheme zenbones")
    end
  },
  -- transparent
  {
    "xiyaowong/nvim-transparent",
  },
  -- lightline
  {
    "itchyny/lightline.vim",
    dependencies = {
      "shinchu/lightline-gruvbox.vim",
    },
    config = function()
      vim.g.lightline = {
        colorscheme = "zenbones",
      }
    end,
  },
  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j", {})
      vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k", {})
      vim.api.nvim_set_keymap("n", "<C-H>", "<C-W>h", {})
      vim.api.nvim_set_keymap("n", "<C-L>", "<C-W>l", {})
    end,
  },
  -- hightlight yank
  {
    "machakann/vim-highlightedyank",
    config = function()
      vim.g.highlightedyank_highlight_duration = 200
    end,
  },
  -- git
  "f-person/git-blame.nvim",
  "airblade/vim-gitgutter",
  -- copilot
  -- {
  -- "CopilotC-Nvim/CopilotChat.nvim",
  -- branch = "main",
  -- dependencies = {
  -- { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
  -- { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  -- },
  -- build = "make tiktoken",       -- Only on MacOS or Linux
  -- config = function()
  -- require("config/copilot")
  -- end,
  -- opts = {
  -- },
  -- },
  -- preview
  "rmagatti/goto-preview",
  "nvim-telescope/telescope.nvim",
  -- fzf
  {
    "ibhagwan/fzf-lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("config/fzf")
    end,
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("config/lsp")
    end,
  },
  -- null-ls
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  },
  -- lsp signature
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  -- fidget
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- "hrsh7th/vim-vsnip",
      "quangnguyen30192/cmp-nvim-tags",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      require("config/cmp")
    end,
  },
  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp"
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config/treesitter")
    end,
  },
  --fern
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-git-status.vim",
    },
    config = function()
      require("config/fern")
    end,
  },
  -- yazi
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim"
    },
  },
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config/which-key")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
  },
  -- commenter
  {
    "preservim/nerdcommenter",
    config = function()
      require("config/nerdcommenter")
    end,
  },
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- LLM
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("config/avante")
    end,
  },
  -- supercollider
  {
    "davidgranstrom/scnvim",
    event = "VeryLazy",
    config = function()
      require("config/scnvim")
    end,
  },
  -- tidal
  {
    "tidalcycles/vim-tidal",
    event = "VeryLazy",
  },
}
