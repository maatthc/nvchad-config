local M = {}

M.keys = {
	{
		"f",
		mode = { "n" },
		function()
			require("flash").jump({
				search = {
					mode = function(str)
						-- Should match only letters, make it a functions
						return "\\<" .. str -- match beginning of words only
					end,
				},
			})
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
		mode = { "n", "x", "o" },
		function()
			require("flash").jump({
				search = {
					forward = false,
					mode = function(str)
						return "\\<" .. str -- Match beginning of words only
					end,
				},
			})
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
