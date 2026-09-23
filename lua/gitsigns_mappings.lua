local gitsigns = require("gitsigns")
local map = vim.keymap.set

-- Navigation
map("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Next hunk" })

map("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Previous hunk" })

-- Actions
map("n", "<leader>gh", gitsigns.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

map("v", "<leader>gh", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })

map("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

map("n", "<leader>gH", gitsigns.stage_buffer, { desc = "Stage buffer " })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview Inline hunk" })

map("n", "<leader>gb", function()
	gitsigns.blame_line()
	-- gitsigns.blame_line({ full = true })
end, { desc = "blame line" })

-- map("n", "<leader>gD", gitsigns.diffthis, { desc = "Diff this line" })

map("n", "<leader>gd", function()
	gitsigns.diffthis("~")
end, { desc = "Diff this buffer" })

-- populates the quickfix list with Git hunks across your entire project
-- map("n", "<leader>hQ", function()
-- 	gitsigns.setqflist("all")
-- end)
-- map("n", "<leader>hq", gitsigns.setqflist)

-- Toggles
map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

-- Text object
map({ "o", "x" }, "gh", gitsigns.select_hunk, { desc = "Select hunk" })

-- Toggle lines colours
map("n", "<leader>th", gitsigns.toggle_linehl, { desc = "Toggle git highlights" })
