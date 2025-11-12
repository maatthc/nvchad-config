local M = {}

local function search_begin_line(forward)
	return {
		search = {
			forward = forward,
			mode = function(str)
				if string.match(str, "%a") then
					return "\\<" .. str -- match beginning of words only
				end
				return str -- should cover numbers and simbols
			end,
		},
	}
end

M.keys = {
	{
		"f",
		mode = { "n" },
		function()
			require("flash").jump(search_begin_line(true))
		end,
		desc = "flash forward",
	},
	{
		"f",
		mode = { "x", "o" },
		function()
			require("flash").jump()
		end,
		desc = "flash forward",
	},
	{
		"F",
		mode = { "n" },
		function()
			require("flash").jump(search_begin_line(false))
		end,
		desc = "Flash backward",
	},
	{
		"F",
		mode = { "x", "o" },
		function()
			require("flash").jump({ search = { forward = false } })
		end,
		desc = "Flash backward",
	},
}

M.opts = {
	jump = { autojump = true, history = true, nohlsearch = true },
	label = { style = "inline", rainbow = { enabled = true } },
	search = { wrap = false, multi_window = true, mode = "search" },
	modes = { search = { enabled = true, highlight = { backdrop = true } }, char = { enabled = false } },
}

return M
