function OpenNewKittyWindow()
  vim.fn.jobstart({ "kitty", "@", "launch", "--cwd=current" }, { detach = true })
end

function OpenFileInNewKittyWindow(filename)
  vim.fn.jobstart({ "kitty", "@", "launch", "--cwd=current", "nvim", filename }, { detach = true })
end

function OpenNewKittyTab()
  vim.fn.jobstart({ "kitty", "@", "launch", "--cwd=current", "--type=tab" }, { detach = true })
end

vim.api.nvim_create_user_command("KittyNewWindow", OpenNewKittyWindow, {})
vim.api.nvim_create_user_command("KittyEdit", function(opts)
  OpenFileInNewKittyWindow(opts.args)
end, { nargs = 1 })
vim.api.nvim_create_user_command("KittyNewTab", OpenNewKittyTab, {})

vim.api.nvim_set_keymap("n", "<leader>kw", "<cmd>lua OpenNewKittyWindow()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ke",
  '<cmd>lua OpenFileInNewKittyWindow(vim.fn.expand("<cfile>"))<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>kt", "<cmd>lua OpenNewKittyTab()<CR>", { noremap = true, silent = true })
