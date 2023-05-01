local map = vim.keymap.set
local opts = { silent = true }

require("ts-node-action").setup()
map("n", "<leader>a", require("ts-node-action").node_action, opts)
