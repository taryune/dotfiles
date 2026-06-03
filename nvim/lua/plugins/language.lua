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
  -- conjure
  {
    "Olical/conjure",
    ft = { "scheme", "scheme.guile", "clojure", "fennel" },
    init = function()
      -- Use the Guile socket client for Scheme files
      vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
      -- Default socket path; override per-project as needed
      vim.g["conjure#client#guile#socket#pipename"] = ".guile-repl.socket"
    end,
  },
  -- guile
  {
    "https://gitlab.com/HiPhish/guile.vim",
    ft = { "scheme", "scheme.guile" },
  },
}
