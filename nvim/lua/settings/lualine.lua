require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      'encoding',
      {'fileformat', icon = ''},
      {'filetype', icon = ''}
    },
    lualine_y = {'progress'},
    lualine_z = {
      'location()',
      {
        'diagnostics',
        sources = {'coc'},
        sections = {'error', 'warn', 'info', 'hint'},
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

function location()
  local line_total = vim.api.nvim_buf_line_count(vim.fn.winbufnr(vim.g.statusline_winid))
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  c = c + 1
  return ':' .. r .. '/' .. line_total .. ' :' .. c
end
