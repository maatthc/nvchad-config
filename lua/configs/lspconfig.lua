-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "zls", "eslint", "ts_ls", "pylsp", "gopls", "clangd" }
local nvlsp = require("nvchad.configs.lspconfig")

-- custom lsp configs
vim.lsp.config("pylsp", {
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501", "W503" },
				},
			},
		},
	},
})

vim.lsp.config("clangd", {
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
	init_options = {
		fallbackFlags = { "--std=c23" },
	},
})

vim.lsp.enable(servers)
