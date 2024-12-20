-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
-- Or use help :h nvui

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "bearded-arc",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.term = {
	sizes = { sp = 0.5, vsp = 0.5, ["bo sp"] = 0.5, ["bo vsp"] = 0.5 },
	-- sp and vsp are horizontal/vertical splits
}

return M
