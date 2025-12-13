return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"VonHeikemen/lsp-zero.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.lsp")
		end,
	},
	-- null-ls
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- lsp signature
	{
		"ray-x/lsp_signature.nvim",
		event = "LspAttach",
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
			"quangnguyen30192/cmp-nvim-tags",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("config.cmp")
		end,
	},
	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
}
