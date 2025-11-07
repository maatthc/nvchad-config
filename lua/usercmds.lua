local usercmd = vim.api.nvim_create_user_command

usercmd("EditZshrc", "e ~/.zshrc", { desc = "Edit ZshRc Config" })
