require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "n") -- good for Ghostty terminal
end, { desc = "Copilot accept" })
--- To use with Kitty terminal, add this to your kitty.conf:
--- map shift+space send_text all \x1b[32;2u

for i = 13, 30 do
	map({ "n", "v", "i", "c" }, "<F" .. i .. ">", "<nop>")
end

-- Fold options (using nvim-ufo)
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

-- Esc to exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>db", function()
	require("snacks").dashboard.open()
end, { desc = "Show Snack Dashboard" })

map("n", "<leader>sp", function()
	if vim.o.spell then
		vim.o.spell = false
		vim.notify("Spell check disabled")
	else
		vim.o.spell = true
		vim.notify("Spell check enabled")
	end
end, { desc = "Toggle Spell check" })
