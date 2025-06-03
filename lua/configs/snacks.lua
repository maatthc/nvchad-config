if vim.loop.os_uname().sysname ~= "Win" then
	-- https://github.com/danielgatis/imgcat
	ImgCmd = "imgcat ~/.config/nvim/assets/waves.gif -silent=true -type=resize -top-offset=1"
end

return {
	dashboard = {
		enabled = true,
		width = 60,
		pane_gap = 16,
		sections = {
			{
				section = "header",
				align = "center",
				enabled = function()
					return not (vim.o.columns > 135)
				end,
			},
			{
				pane = 1,
				{
					enabled = function()
						return vim.o.columns > 135
					end,
					section = "terminal",
					cmd = ImgCmd,
					ttl = 0,
					height = 32,
					width = 56,
					padding = 1,
				},
				{
					section = "startup",
					padding = 1,
					enabled = function()
						return vim.o.columns > 135
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
					icon = "󱥚",
					padding = 1,
				},
				{
					action = "<leader>ch",
					key = "m",
					desc = "Mappings",
					icon = " ",
					padding = 1,
					gap = 1,
				},
				{
					icon = " ",
					title = "Recent Files",
				},
				{
					section = "recent_files",
					opts = { limit = 3 },
					indent = 2,
					padding = 1,
				},
				{
					icon = " ",
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
						return not (vim.o.columns > 135)
					end,
				},
			},
		},
	},
	bigfile = { enabled = true },
	image = { enabled = true },
	lazygit = { enabled = true },
	scroll = { enabled = true },
}
