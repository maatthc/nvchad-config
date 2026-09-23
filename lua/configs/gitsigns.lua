require("gitsigns").setup({
	linehl = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 200,
	},

	on_attach = function()
		vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#2e3f34", blend = 80, dim = true })
		vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#363021", blend = 80, dim = true })
		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
			fg = "#d2da3f",
			dim = true,
		})
	end,
})
