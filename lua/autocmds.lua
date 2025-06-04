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
