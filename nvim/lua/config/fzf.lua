require("fzf-lua").setup({ "fzf-vim" })
local wk = require("which-key")

local key_map = {
	{ "<leader>f", group = "fzf" },
	mode = { "n" },
	{ "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "FZF Files" },
	{ "<leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>", desc = "FZF Grep" },
}
wk.add(key_map)
