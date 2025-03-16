require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC" })

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "n") -- good for Ghostty terminal
end, { desc = "Copilot accept" })
--- To use with Kitty terminal, add this to your kitty.conf:
--- map shift+space send_text all \x1b[32;2u

for i = 13, 30 do
	map({ "n", "v", "i", "c" }, "<F" .. i .. ">", "<nop>")
end
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Fold options (using nvim-ufo)
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
