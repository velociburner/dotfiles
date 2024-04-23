local map = vim.keymap.set
local opts = { silent = true }

require('telescope').setup({
  pickers = {
    buffers = {
      theme = 'dropdown',
      previewer = false,
      sort_lastused = true,
      sort_mru = true
    },
    treesitter = {
      theme = 'dropdown'
    },
    diagnostics = {
      theme = 'dropdown'
    },
    lsp_document_symbols = {
      theme = 'dropdown'
    }
  },
  extensions = {
    file_browser = {
      theme = 'ivy'
    }
  }
})

local M = {}
local tb = require('telescope.builtin')
function M.project_files()
  local ok = pcall(tb.git_files)
  if not ok then
    tb.find_files()
  end
end

-- Resume last command
map('n', '<leader>fr', '<cmd>Telescope resume<cr>', opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>lua require("configs.telescope").project_files()<cr>', opts)
map('n', '<leader>fgr', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Vim info
map('n', '<leader>fc', '<cmd>Telescope commands<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)

-- Treesitter outline
map('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', opts)

-- LSP
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', opts)
map('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', opts)

-- Git
map("n", "<leader>fgs", '<cmd>Telescope git_status<cr>', opts)
map("n", "<leader>fgb", '<cmd>Telescope git_branches<cr>', opts)

-- File browser
map("n", "<leader>fl", '<cmd>Telescope file_browser<cr>', opts)

return M
