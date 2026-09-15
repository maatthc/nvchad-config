require("nvchad.options")
local o = vim.o

vim.diagnostic.config({
	virtual_lines = { current_line = true },
})
o.relativenumber = true
o.cursorlineopt = "both"

-- Background color of the selected text line
vim.api.nvim_set_hl(0, "CursorLine", { fg = "#535863", bg = "#2e3440" })
-- Text color and background of the active line number
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b8473e", bg = "#2e3440" })

-- Fold options (using nvim-ufo)
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- To force Nvim to use the OSC 52 provider for clipboard
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

o.spelllang = "en_au"

o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,localoptions"
