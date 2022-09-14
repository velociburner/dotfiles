local function custom_location()
  local line_total = vim.api.nvim_buf_line_count(vim.fn.winbufnr(vim.g.statusline_winid))
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  c = c + 1
  return ':' .. r .. '/' .. line_total .. ' :' .. c
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {
      'encoding', 'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {
      custom_location,
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info', 'hint'},
        symbols = {error = '', warn = '', info = '', hint = 'H'}
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