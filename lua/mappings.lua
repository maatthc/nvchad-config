require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Unset NvChad defaults to remap
nomap("n", "<leader>ds")
nomap("n", "<leader>ma")
nomap("n", "<leader>cm")
nomap("n", "<leader>gt")
nomap("n", "<leader>pt")

-- Telescope
map("n", "<space><space>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files " })
map("n", "<leader>fM", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fd", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>gd", "<cmd>CodeDiff<CR>", { desc = "Git Diff" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "telescope git files" })
map("n", "<leader>gf", "<cmd>Telescope git_stash<CR>", { desc = "telescope git stash" })

map("n", "<leader>yp", ":let @+=expand('%:.')<cr>", { desc = "Copy current buffer relative path" })
map("n", "<leader>yP", ":let @+=@%<cr>", { desc = "Copy current buffer absolute path" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("o", ".", ";", { desc = "In command mode, '.' as '; for ftFT'" })
-- map("i", "jk", "<ESC>", { desc = "In Insert mode, just enter 'jk' to simulate ESC" })
map("n", "jk", ":", { desc = "In Normal mode, just enter 'jk' to simulate : " })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

map("i", "<S-SPACE>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "n")
end, { desc = "Copilot accept" })
--- To use with Kitty terminal(the best), add this to your kitty.conf:
--- map shift+space send_text all \x1b[32;2u
map("n", "<leader>tp", function()
	if vim.fn["copilot#Enabled"]() == 1 then
		vim.cmd("Copilot disable")
		print("Copilot Disabled")
	else
		vim.cmd("Copilot enable")
		print("Copilot Enabled")
	end
end, { desc = "Copilot Toggle" })

-- predictive_tap_hold(QMK keyboard) is sending it for 's' and 'l', probably other keys are having similar issues
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

map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>db", function()
	require("snacks").dashboard.open()
end, { desc = "Show Dashboard" })

map("n", "<leader>ts", function()
	if vim.o.spell then
		vim.o.spell = false
		vim.notify("Spell check disabled")
	else
		vim.o.spell = true
		vim.notify("Spell check enabled")
	end
end, { desc = "Spell check Toggle " })

-- Terminal splitting and resizing: mrjones2014/smart-splits.nvim
-- Comment to test 'mini.move'
-- map("n", "<A-h>", require("smart-splits").resize_left)
-- map("n", "<A-j>", require("smart-splits").resize_down)
-- map("n", "<A-k>", require("smart-splits").resize_up)
-- map("n", "<A-l>", require("smart-splits").resize_right)

map({ "n", "t" }, "<C-h>", require("smart-splits").move_cursor_left)
map({ "n", "t" }, "<C-j>", require("smart-splits").move_cursor_down)
map({ "n", "t" }, "<C-k>", require("smart-splits").move_cursor_up)
map({ "n", "t" }, "<C-l>", require("smart-splits").move_cursor_right)
-- Terminal splitting and resizing END

-- LSP: 'gr*' https://neovim.io/doc/user/lsp.html#gra
vim.keymap.set("n", "grf", function()
	vim.lsp.buf.format({ async = false })
end, { desc = "LSP Format Document" })
map("n", "grs", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "grd", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = { "function", "class", "method", "constructor", "struct" },
	})
end, { desc = "LSP document Symbols" })
map("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
		print("LSP Diagnostics Disabled")
	else
		vim.diagnostic.enable()
		print("LSP Diagnostics Enabled")
	end
end, { desc = "LSP diagnostic Toggle" })
