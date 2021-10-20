require'lualine'.setup {
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
        'location',
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
