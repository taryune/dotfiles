return {
  -- colorscheme
  -- {
  -- "EdenEast/nightfox.nvim"
  -- ,
  -- name = "nightfox",
  -- config = function()
  -- vim.cmd("colorscheme carbonfox")
  -- end
  -- },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.cmd("colorscheme forestbones")
    end
  },
  -- transparent
  -- {
  -- "xiyaowong/nvim-transparent",
  -- },
  -- lightline
  {
    "itchyny/lightline.vim",
    dependencies = {
      "shinchu/lightline-gruvbox.vim",
    },
    config = function()
      vim.g.lightline = {
        colorscheme = "forestbones",
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
  -- yazi
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      -- check the installation instructions at
      -- https://github.com/folke/snacks.nvim
      "folke/snacks.nvim"
    },
  },
  -- oil
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    config = function()
      require("config/oil")
    end,
    lazy = false,
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
