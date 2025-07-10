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

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
