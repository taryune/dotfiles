return {
  -- haskell
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  -- supercollider
  {
    "davidgranstrom/scnvim",
    ft = { "supercollider", "scd", "sc" },
    config = function()
      require("config.scnvim")
    end,
  },
  -- tidal
  {
    "tidalcycles/vim-tidal",
    ft = { "tidal" },
  },
}
