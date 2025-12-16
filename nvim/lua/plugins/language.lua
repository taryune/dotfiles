return {
  -- haskell
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^6", -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  -- telescope-hoogle
  {
    "luc-tielen/telescope_hoogle",
    ft = { "haskell", "lhaskell", "cabal" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("hoogle")
    end,
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
