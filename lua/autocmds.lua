local group = vim.api.nvim_create_augroup("mine", { clear = true })

-- When opening a directory, open a new buffer and open nvim-tree
local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1
	if directory then
		vim.cmd.cd(data.file)
		vim.cmd.enew()
	  require("nvim-tree.api").tree.open()
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = open_nvim_tree,
	group = group,
})

-- Show Nvdash when all buffers are closed 
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
