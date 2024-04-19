vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  group = vim.api.nvim_create_augroup("AutoRead", { clear = true }),
  pattern = "*",
  command = "checktime"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  pattern = "*",
  command = "silent! lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 500 })"
})

vim.api.nvim_create_augroup("IncsearchHighlight", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = "IncsearchHighlight",
  pattern = {"/", "\\?"},
  command = "set hlsearch"
})
vim.api.nvim_create_autocmd("CmdLineLeave", {
  group = "IncsearchHighlight",
  pattern = {"/", "\\?"},
  command = "set nohlsearch"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.jsonl",
  group = vim.api.nvim_create_augroup("CustomFiletype", { clear = true }),
  command = "setfiletype json",
})
