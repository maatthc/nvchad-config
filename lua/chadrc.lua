-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
-- Or use help :h nvui

-- Helpers
vim.cmd("highlight St_relativepath guifg=#626a83 guibg=#2a2b36")

local stbufnr = function()
	return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

-- Helpers end

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "bearded-arc",
	integrations = { "render-markdown" },
}

M.term = {
	sizes = { sp = 0.5, vsp = 0.5, ["bo sp"] = 0.5, ["bo vsp"] = 0.5 },
	-- sp and vsp are horizontal/vertical splits
}

-- Full path on file open on buffer
M.ui = {
	statusline = {
		theme = "default",
		order = { "mode", "cwd", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor" },
		modules = {
			relativepath = function()
				local path = vim.api.nvim_buf_get_name(stbufnr())
				if path == "" then
					return ""
				end
				return "%#St_relativepath# " .. vim.fn.expand("%:.:h") .. "/"
			end,
		},
	},
	nvdash = {
		load_on_startup = false,
	},
}

return M
