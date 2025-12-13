return {
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
