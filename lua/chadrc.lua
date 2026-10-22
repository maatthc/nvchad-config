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
	theme = "chadracula-evondev",
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
		order = {
			"mode",
			"cwd",
			"relativepath",
			"file",
			"git",
			"num_selected_lines",
			"%=",
			"lsp_msg",
			"%=",
			"diagnostics",
			"lsp",
			"cursor",
		},
		modules = {
			relativepath = function()
				local path = vim.api.nvim_buf_get_name(stbufnr())
				if path == "" then
					return ""
				end
				return "%#St_relativepath# " .. vim.fn.expand("%:.:h") .. "/"
			end,
			file = function()
				local filename = vim.fn.expand("%:t")
				local extension = vim.fn.expand("%:e")
				if filename == "" then
					filename = "Empty"
				end
				local devicons_present, devicons = pcall(require, "nvim-web-devicons")
				local icon = "    " -- Fallback icon
				if devicons_present then
					local f_icon = devicons.get_icon(filename, extension, { default = true })
					if f_icon then
						icon = " " .. f_icon .. " "
					end
				end
				local modified_icon = vim.bo.modified and " %#DiagnosticInfo#●" or " %#DiagnosticError#X"
				return "%#St_file_bg#" .. icon .. "%#St_file_txt#" .. filename .. modified_icon .. " "
			end,
			num_selected_lines = function()
				local mode = vim.fn.mode()
				if mode:find("[vV\22]") then
					local start_line = vim.fn.line("v")
					local end_line = vim.fn.line(".")
					local lines = math.abs(end_line - start_line) + 1
					return "%#St_file_bg#" .. "  Selected lines " .. lines
				end
				return ""
			end,
		},
	},
	nvdash = {
		load_on_startup = false,
	},
}

return M
