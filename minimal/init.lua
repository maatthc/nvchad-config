--
-- Minimal with lazy.nvim
-- Description: This is a minimal configuration to test new plugins
-- Run: nvim -u ~/.config/nvim/minimal/init.lua
--
local root = vim.fn.stdpath("config") .. "/minimal/data"
for _, name in ipairs({ "config", "data", "state", "cache" }) do
	vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end
local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)
local plugins = {
	"folke/tokyonight.nvim",
	{
		"folke/which-key.nvim",
		lazy = false,
	},
	{
		"gbprod/cutlass.nvim",
		event = "VeryLazy",
	},
}
require("lazy").setup(plugins, { root = root .. "/plugins" })
vim.cmd.colorscheme("tokyonight")
