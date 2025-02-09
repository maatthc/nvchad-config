require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC" })

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "n") -- good for Ghostty terminal only
end, { desc = "Copilot accept" })

for i = 13, 30 do
	map({ "n", "v", "i", "c" }, "<F" .. i .. ">", "<nop>", { desc = "Ignore function keys" })
end
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
