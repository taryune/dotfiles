return {
  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
  },
  -- oil
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      require("config.oil")
    end,
    lazy = false,
  },
  -- fzf
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.fzf")
    end,
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
  },
  -- yazi
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
  },
  -- goto-preview
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120,
        height = 15,
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
        default_mappings = false,
        debug = false,
        opacity = nil,
        resizing_mappings = false,
        post_open_hook = nil,
        references = {
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
        },
        focus_on_open = true,
        dismiss_on_move = false,
        force_close = true,
        bufhidden = "wipe",
        stack_floating_preview_windows = true,
        preview_window_title = { enable = true, position = "left" },
      })
    end,
  },
}
