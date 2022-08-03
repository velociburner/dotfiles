require('bufferline').setup {
  options = {
    numbers = function(opts)
        return string.format('%s%s', opts.ordinal, opts.raise(opts.id))
    end,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = nil,    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {{filetype = "nerdtree", text = "File Explorer", text_align = "left"}},
    show_buffer_icons = false, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id'
  }
}

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<space>l', ':BufferLineCycleNext<cr>', opts)
map('n', '<space>h', ':BufferLineCyclePrev<cr>', opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<M-S-l>', ':BufferLineMoveNext<cr>', opts)
map('n', '<M-S-h>', ':BufferLineMovePrev<cr>', opts)

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', '<leader>be', ':BufferLineSortByExtension<cr>', opts)
map('n', '<leader>bd', ':BufferLineSortByDirectory<cr>', opts)

-- Pick a buffer
map('n', 'gb', ':BufferLinePick<cr>', opts)

map('n', '<space>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', opts)
map('n', '<space>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', opts)
map('n', '<space>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', opts)
map('n', '<space>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', opts)
map('n', '<space>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', opts)
map('n', '<space>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', opts)
map('n', '<space>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', opts)
map('n', '<space>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', opts)
map('n', '<space>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', opts)
map('n', '<space>0', '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>', opts)
