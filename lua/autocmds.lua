local group = vim.api.nvim_create_augroup("maat", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Show dashboard when all buffers are closed
autocmd("BufDelete", {
	callback = function()
		local bufs = vim.t.bufs
		if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
			require("snacks").dashboard.open()
		end
	end,
	group = group,
})

-- Restore cursor position
autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
	group = group,
})

-- Highlight yanked text
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
})

-- Automatically start insert mode in terminal buffers
-- but not for the terminal of the dashboard
autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function(ev)
		if string.find(ev.match, "term") ~= nil then
			-- print(print(vim.inspect(ev)))
			vim.cmd(":startinsert")
		end
	end,
	group = group,
})

-- Open help files in a vertical split
autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("wincmd L")
	end,
	group = group,
})

-- Delete Comments
vim.api.nvim_create_augroup("DeleteComments", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "DeleteComments",
	pattern = "*",
	callback = function()
		local commentstring = vim.bo.commentstring
		if commentstring and commentstring ~= "" then
			local comment_symbol = commentstring:gsub("%%s", ""):gsub("%s+$", "")
			local escaped_symbol = vim.fn.escape(comment_symbol, [[/*~^$.[]])
			vim.keymap.set({ "n" }, "<Leader>dc", function()
				vim.cmd(string.format([[g/^\s*%s/d]], escaped_symbol))
			end, { buffer = true, desc = "Delete ALL commented lines", silent = true })
			vim.keymap.set("x", "<Leader>dc", function()
				-- Get the start and end lines of the visual selection
				local start_line = vim.fn.line("v")
				local end_line = vim.fn.line(".")
				if start_line > end_line then
					start_line, end_line = end_line, start_line
				end
				vim.cmd(string.format([[%d,%dg/^\s*%s/d]], start_line, end_line, escaped_symbol))
			end, { buffer = true, desc = "Delete commented lines in selection", silent = true })
		end
	end,
})
