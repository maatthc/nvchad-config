local imgcat = "imgcat"

if vim.fn.executable(imgcat) == 0 then
	return {
		dashboard = {
			preset = {
				header = { "'imgcat' not found: please install it from: https://github.com/danielgatis/imgcat" },
			},
		},
	}
end

if vim.loop.os_uname().sysname == "Linux" then
	Gif = "waves.gif"
else
	Gif = "it-crowd.gif"
end

local path = vim.fn.stdpath("config") .. "/assets/"
local params = " -silent=true -type=resize -top-offset=1 "
local imgCmd = imgcat .. params .. path .. Gif

local minCol = 135
local paneGap = vim.o.columns > (minCol + 10) and 16 or 3

return {
	dashboard = {
		enabled = true,
		width = 60,
		pane_gap = paneGap,
		sections = {
			{
				section = "header",
				align = "center",
				enabled = function()
					return vim.o.columns < minCol
				end,
			},
			{
				pane = 1,
				{
					enabled = function()
						return vim.o.columns > minCol
					end,
					section = "terminal",
					cmd = imgCmd,
					-- ttl = 0,
					height = 32,
					width = 56,
					padding = 1,
				},
				{
					section = "startup",
					padding = 1,
					enabled = function()
						return vim.o.columns > minCol
					end,
				},
			},
			{
				pane = 2,
				{ section = "keys", padding = 1, gap = 1 },
				{
					action = "<leader>th",
					key = "t",
					desc = "Themes",
					icon = "🇦🇺",
					padding = 1,
				},
				{
					action = "<leader>ch",
					key = "m",
					desc = "Mappings",
					icon = "⌨️",
					padding = 1,
					gap = 1,
				},
				{
					action = ":EditZshrc",
					key = "z",
					desc = "Zshrc Config",
					icon = "💻",
					padding = 1,
					gap = 1,
				},
				{
					action = ":e ~/.config/kitty/kitty.conf",
					key = "k",
					desc = "Kitty Config",
					icon = "🐱",
					padding = 1,
					gap = 1,
				},
				{
					icon = "📄",
					title = "Recent Files",
				},
				{
					section = "recent_files",
					opts = { limit = 3 },
					indent = 2,
					padding = 1,
				},
				{
					icon = "📁",
					title = "Projects",
				},
				{
					section = "projects",
					opts = { limit = 3 },
					indent = 2,
					padding = 1,
				},
				{
					section = "startup",
					padding = 1,
					enabled = function()
						return vim.o.columns < minCol
					end,
				},
			},
		},
	},
	bigfile = { enabled = true, line_length = 10000 },
	image = { enabled = true },
	lazygit = { enabled = true },
	scroll = { enabled = true },
}
