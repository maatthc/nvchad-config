local options = {
	formatters_by_ft = {
		go = { "gofmt" },
		python = { "black" },
		lua = { "stylua" },
		css = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		zig = { "zigfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	-- Perhas use prettierd?

	format_on_save = function(buffer)
		if not vim.b[buffer].disable_autoformat then
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		end
	end,
}

return options
