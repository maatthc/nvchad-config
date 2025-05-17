local inspect = require("./inspect")

local opts = {
	ensure_installed = {
		"vim",
		"lua",
		"vimdoc",
		"html",
		"css",
		"javascript",
		"typescript",
		"json",
		"zig",
	},
	textobjects = require("../configs.treesitter-textobjects"),
}
print(inspect(opts))
