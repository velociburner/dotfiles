local map = vim.keymap.set
local opts = { silent = true }
local tb = require('telescope.builtin')

-- Resume last command
map('n', '<leader>fr', '<cmd>Telescope resume<cr>', opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>lua project_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Vim info
map('n', '<leader>fc', '<cmd>Telescope commands<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)

-- Treesitter outline
map('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', opts)

-- LSP diagnostics
map('n', '<leader>fl', '<cmd>Telescope lsp_document_diagnostics<cr>', opts)

project_files = function()
  local ok = pcall(tb.git_files)
  if not ok then
    tb.find_files()
  end
end
