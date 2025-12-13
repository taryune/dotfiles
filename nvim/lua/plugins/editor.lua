return {
	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- commenter
	{
		"preservim/nerdcommenter",
		config = function()
			require("config.nerdcommenter")
		end,
	},
	-- highlight yank
	{
		"machakann/vim-highlightedyank",
		config = function()
			vim.g.highlightedyank_highlight_duration = 200
		end,
	},
}
