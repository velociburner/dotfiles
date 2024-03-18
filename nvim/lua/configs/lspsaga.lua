local map = vim.keymap.set
local opts = { silent = true }

require('lspsaga').setup {
  definition = {
    width = 0.5,
    height = 0.2,
    save_pos = true
  },
  finder = {
    max_height = 0.3,
    left_width = 0.2,
    right_width = 0.2,
    keys = {
      toggle_or_open = '<CR>',
      vsplit = 'v'
    }
  },
  outline = {
    keys = {
      toggle_or_jump = '<CR>'
    }
  }
}

map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
map('n', '<localleader>D', '<cmd>Lspsaga peek_definition<cr>', opts)
map('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
map('n', '<localleader>gr', '<cmd>Lspsaga finder<cr>', opts)
map('n', '<localleader>rn', '<cmd>Lspsaga rename<cr>', opts)
map('n', '<localleader>ca', '<cmd>Lspsaga code_action<cr>', opts)
map('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
map('n', '<localleader>d', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
map('n', '<localleader>o', '<cmd>Lspsaga outline<cr>', opts)
map('n', '<localleader>t', '<cmd>Lspsaga term_toggle<cr>', opts)
