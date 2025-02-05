return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"zig",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			filters = { custom = { "^.git$" } },
			renderer = {
				icons = {
					glyphs = {
						git = { unmerged = "", unstaged = "" },
					},
				},
			},
		},
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			suppressed_dirs = { "~/", "~/Documents/", "~/Downloads", "/" },
			show_auto_restore_notif = true,
		},
		keys = {
			{ "<leader>ss", "<cmd>SessionSearch<CR>", desc = "Session search" },
		},
	},

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Mapping Tab is already used by nvim-cmp
			-- Create a fallback to use <S-Space> instead
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
			})
		end,
	},
	{
		"ggandor/leap.nvim", -- Leap Motion has the key 's' hardcoded, so we need to remove it to use 'f'
		enabled = true,
		keys = {
			{ "f", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
			{ "F", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
			{ "gf", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
			vim.keymap.del({ "n", "x", "o" }, "s")
			vim.keymap.del({ "n", "x", "o" }, "S")
			vim.keymap.del({ "n", "x", "o" }, "gs")
			vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")
		end,
	},
}
