-- Minimal config for Kitty scroll mode - Kitty config:
-- map kitty_mod+h launch --stdin-source=@screen_scrollback --stdin-add-formatting --type=overlay zsh -c "SCROLL_MODE=2 nvim -c 'silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - ' -c 'set number' -c 'set relativenumber'"
if os.getenv("SCROLL_MODE") then
	vim.keymap.set({ "n", "v" }, "q", "<Cmd>qa!<CR>")
	vim.keymap.set({ "n", "v" }, "<ESC>", "<Cmd>qa!<CR>")
	vim.keymap.set({ "n", "v" }, "yy", "yy<Cmd>qa!<Cr>")
	vim.cmd([[
    colorscheme wildcharm
    set clipboard=unnamed cursorline cursorlineopt=both
    set laststatus=0 nonu nornu signcolumn=no cmdheight=0
  ]])

	PROMPT_LINES_IGNORE = 2 -- Position cursor at: last line - this
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "*",
		callback = function()
			vim.defer_fn(function()
				local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), 0, -1, false)
				for i = #lines, 1, -1 do
					if lines[i]:match("%S") then
						vim.api.nvim_win_set_cursor(0, { i - PROMPT_LINES_IGNORE, 0 })
						break
					end
				end
			end, 50)
		end,
	})

	vim.pack.add({ "https://github.com/folke/flash.nvim" })
	local flash = require("flash")
	flash.setup()
	vim.keymap.set({ "n", "x", "o" }, "f", function()
		flash.jump()
	end, { desc = "Flash: Navigate your code with search labels" })

	return
end

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

-- Load your own cmds
require("autocmds")
require("usercmds")

vim.schedule(function()
	require("mappings")
end)
