return {
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		messages = { enabled = false },
		hover = { enabled = true },
		signature = { enabled = true, auto_open = { enabled = false } },
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
	routes = {
		{ -- Due to Noice bug: 1097
			filter = { event = "msg_show", kind = { "shell_out", "shell_err" } },
			view = "notify",
			opts = {
				level = "info",
				skip = false,
				replace = false,
			},
		},
		{ -- Due to warning: position_encoding param is required in vim.lsp.util.make_position
			filter = {
				warning = true,
				event = "notify",
				cond = function(e)
					return vim.startswith(e:content(), "position_encoding param is required")
				end,
			},
			opts = { skip = true },
		},
	},
}
