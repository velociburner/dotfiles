local map = vim.keymap.set
local opts = { silent = true }

map('n', '<leader>do', '<cmd>DiffviewOpen<cr>', opts)
map('n', '<leader>dc', '<cmd>DiffviewClose<cr>', opts)
map('n', '<leader>dt', '<cmd>DiffviewToggleFiles<cr>', opts)
map({'n', 'v'}, '<leader>gl', ':DiffviewFileHistory %<cr>', opts)
map('n', '<leader>gL', '<cmd>DiffviewFileHistory<cr>', opts)
