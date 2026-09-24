local function ensure_buf(buf)
	if not buf or buf == nil or buf == 0 or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_get_current_buf()
	end
	return buf
end

local function get_filepath(buf)
	buf = ensure_buf(buf)
	return vim.api.nvim_buf_get_name(buf)
end

local function close_diff_win(key)
	if not key then
		return ""
	end
	local has_diff = vim.wo.diff
	local target_win
	if not has_diff then
		return key
	end

	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		local bufname = get_filepath(buf)
		if bufname:find("^gitsigns://") then
			target_win = win
			break
		end
	end
	if target_win then
		vim.schedule(function()
			vim.api.nvim_win_close(target_win, true)
		end)
		return ""
	end

	return key
end

require("gitsigns").setup({
	linehl = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 200,
	},

	on_attach = function()
		vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#2e3f34", blend = 80, dim = true })
		vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#363021", blend = 80, dim = true })
		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
			fg = "#d2da3f",
			dim = true,
		})

		local group = vim.api.nvim_create_augroup("plugins.gitsigns", { clear = true })
		vim.api.nvim_create_autocmd("OptionSet", {
			pattern = "diff",
			group = group,
			desc = "Close Gitsigns Diff window",
			callback = function(e)
				vim.keymap.set("n", "q", function()
					close_diff_win("q")
				end, { expr = true, silent = true, buffer = e.buf })
			end,
		})
	end,
})
