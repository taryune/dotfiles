require("fzf-lua").setup({ "fzf-vim" })
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
