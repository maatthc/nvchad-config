return {
	api_token = nil,
	backend = "openai",
	url = "http://192.168.0.250:11434",
	model = "qwen2.5-coder:3b",

	tokens_to_clear = { "<|endoftext|>", "<|file_sep|>" },
	request_body = {
		max_tokens = 60,
		temperature = 0.2,
		top_p = 0.95,
	},
	fim = {
		enabled = true,
		prefix = "<|fim_prefix|>",
		middle = "<|fim_middle|>",
		suffix = "<|fim_suffix|>",
	},
	debounce_ms = 150,
	accept_keymap = "<S-Space>",
	dismiss_keymap = "<M-a>", -- Alt
	tls_skip_verify_insecure = false,
	lsp = {
		bin_path = nil,
		host = nil,
		port = nil,
		cmd_env = nil,
		version = "0.5.3",
	},
	tokenizer = {
		repository = "Qwen/Qwen2.5-Coder-3B",
	},
	context_window = 2048,
	enable_suggestions_on_startup = true,
	enable_suggestions_on_files = "*",
	disable_url_path_completion = false,
}
