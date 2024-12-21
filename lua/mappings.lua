require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC"})

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot accept" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
