-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "zls", "eslint", "ts_ls", "pylsp", "gopls" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end
-- custom lsp configs
lspconfig.pylsp.setup({
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
