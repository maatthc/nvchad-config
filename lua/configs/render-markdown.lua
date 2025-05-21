-- Base46 integration cache load
dofile(vim.g.base46_cache .. "render-markdown")

---@type render.md.UserConfig
local opts = {
	completions = {
		lsp = { enabled = true },
	},
	render_modes = { "n", "c", "t" },
	heading = {
		sign = false,
		border = true,
		below = "▔",
		above = "▁",
		left_pad = 0,
		position = "left",
		icons = {
			"█ ",
			"██ ",
			"███ ",
			"████ ",
			"█████ ",
			"██████ ",
		},
	},
}

return opts
