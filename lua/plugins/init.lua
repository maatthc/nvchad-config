return {
	-- Bundle of more than 30 new text objects
	-- https://github.com/chrisgrieser/nvim-various-textobjs?tab=readme-ov-file#list-of-text-objects
	-- {
	-- 	"chrisgrieser/nvim-various-textobjs",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		keymaps = {
	-- 			useDefaults = true,
	-- 		},
	-- 	},
	-- },

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = require("configs.snacks"),
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
		keys = {
			{
				"<leader>tF",
				function()
					vim.b.disable_autoformat = not vim.b.disable_autoformat
					vim.notify("Autoformat: " .. (vim.b.disable_autoformat and "Disabled" or "Enabled"))
				end,
				desc = "Toggle autoformat for current buffer",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
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
				"python",
				"go",
			},
			textobjects = require("configs.treesitter-textobjects"),
		},
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			suppressed_dirs = { "~/", "~/Documents/", "~/Downloads", "/" },
		},
	},

	{
		"github/copilot.vim",
		enabled = false,
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
					hover = { enabled = false },
					signature = { enabled = false },
				},
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},

	{
		"ggandor/leap.nvim", -- Leap Motion has the key 's' hard coded, so we need to remove it to use 'f'
		enabled = true,
		keys = {
			{ "f", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
			{ "F", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
			{ "fs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			{ "hrsh7th/cmp-cmdline" },
		},
		opts = function()
			local cmp = require("cmp")
			cmp.setup.cmdline({ "/", "?" }, {
				completion = { completeopt = "menu,menuone,noselect" },
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				completion = { completeopt = "menu,menuone,noselect" },
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		opts = {
			provider_selector = function()
				return { "lsp", "indent" }
			end,
		},
	},

	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {
			cursor_color = "#ff8800",
			stiffness = 0.8,
			trailing_stiffness = 0.3,
			trailing_exponent = 5,
			never_draw_over_target = true,
			hide_target_hack = true,
			gamma = 1,
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		opts = require("configs.render-markdown"),
	},

	-- :Td
	{
		"vimichael/floatingtodo.nvim",
		event = "VeryLazy",
		opts = {
			target_file = "~/todo.md",
			border = "single", -- single, rounded, etc.
		},
	},

	{
		"folke/which-key.nvim",
		lazy = false,
	},

	{
		"gbprod/cutlass.nvim",
		event = "VeryLazy",
		opts = { cut_key = "m", registers = { change = "c" } },
	},

	-- Terminal splitting and resizing
	{ "mrjones2014/smart-splits.nvim", lazy = false, build = "./kitty/install-kittens.bash" },

	-- File Navigation
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{
				"<leader>.",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file location",
			},
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
	},

	{ -- Replace by Yazi
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},
}
