tb = require('telescope.builtin')

-- Resume last command
map('n', '<leader>fr', '<cmd>lua tb.resume()<cr>', opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>lua require("settings.telescope").project_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua tb.live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua tb.buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua tb.help_tags()<cr>', opts)

-- Vim info
map('n', '<leader>fc', '<cmd>lua tb.commands()<cr>', opts)
map('n', '<leader>fk', '<cmd>lua tb.keymaps()<cr>', opts)

-- Treesitter outline
map('n', '<leader>ft', '<cmd>lua tb.treesitter()<cr>', opts)

-- LSP diagnostics
map('n', '<leader>fl', '<cmd>lua tb.lsp_document_diagnostics()<cr>', opts)

local M = {}

M.project_files = function()
  local opts = {}
  local ok = pcall(tb.git_files, opts)
  if not ok then
    tb.find_files(opts)
  end
end

return M
