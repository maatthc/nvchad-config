require("nvchad.mappings")

local map = vim.keymap.set

map("n", "<leader>yp", ":let @+=expand('%:.')<cr>", { desc = "Copy relative path" })
map("n", "<leader>yP", ":let @+=@%<cr>", { desc = "Copy absolute path" })
map("n", "<space><space>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files - Mine" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("o", ".", ";", { desc = "In command mode, '.' as '; for ftFT'" })
map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "n") -- good for Ghostty terminal
end, { desc = "Copilot accept" })
--- To use with Kitty terminal, add this to your kitty.conf:
--- map shift+space send_text all \x1b[32;2u

-- predictive_tap_hold is sending it for 's' and 'l'
map({ "n", "v", "i", "c", "o" }, "<M-F23>", "<nop>")

-- Fold options (using nvim-ufo)
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "<leader>tz", function()
	if vim.g.foldall then
		vim.g.foldall = false
		require("ufo").openAllFolds()
	else
		vim.g.foldall = true
		require("ufo").closeAllFolds()
	end
end, { desc = "Fold All Toggle " })

-- Esc to exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>db", function()
	require("snacks").dashboard.open()
end, { desc = "Show Snack Dashboard" })

map("n", "<leader>ts", function()
	if vim.o.spell then
		vim.o.spell = false
		vim.notify("Spell check disabled")
	else
		vim.o.spell = true
		vim.notify("Spell check enabled")
	end
end, { desc = "Spell check Toggle " })

-- Terminal splitting and resizing
-- mrjones2014/smart-splits.nvim
map("n", "<A-h>", require("smart-splits").resize_left)
map("n", "<A-j>", require("smart-splits").resize_down)
map("n", "<A-k>", require("smart-splits").resize_up)
map("n", "<A-l>", require("smart-splits").resize_right)

map({ "n", "t" }, "<C-h>", require("smart-splits").move_cursor_left)
map({ "n", "t" }, "<C-j>", require("smart-splits").move_cursor_down)
map({ "n", "t" }, "<C-k>", require("smart-splits").move_cursor_up)
map({ "n", "t" }, "<C-l>", require("smart-splits").move_cursor_right)

-- Terminal splitting and resizing END

-- LSP --- Use grn/gca/gcd/gcr instead: gO list all symbols, In insert mode, <Ctrl-s> displays the function signature
-- map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
-- map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename" })
-- map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
-- map("n", "<leader>cu", vim.lsp.buf.references, { desc = "LSP References(uses)" })
