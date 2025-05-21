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
					cmd = "chafa ~/.config/nvim/assets/waves.gif --size 55x32 --format symbols --stretch; sleep 1",
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
	indent = { enabled = true },
	input = { enabled = true },
	animate = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	image = { enabled = true },
	lazygit = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	win = { enabled = true },
	words = { enabled = true },
	scroll = { enabled = true },
}
