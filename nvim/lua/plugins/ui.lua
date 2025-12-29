return {
  -- colorscheme
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.cmd("colorscheme neobones")
    end,
  },
  -- lightline
  {
    "itchyny/lightline.vim",
    dependencies = {
      "shinchu/lightline-gruvbox.vim",
    },
    config = function()
      vim.g.lightline = {
        colorscheme = "neobones",
      }
    end,
  },
  -- icons
  {
    "nvim-mini/mini.icons",
    opts = {},
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config.which-key")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
  },
}
