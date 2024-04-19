local gitsigns = require('gitsigns')

gitsigns.setup({
  on_attach = function (bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function ()
      if vim.wo.diff then
        vim.cmd.normal({']h', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[h', function ()
      if vim.wo.diff then
        vim.cmd.normal({'[h', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>gs', gitsigns.stage_hunk)
    map('n', '<leader>gr', gitsigns.reset_hunk)
    map('n', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gS', gitsigns.stage_buffer)
    map('n', '<leader>gR', gitsigns.reset_buffer)
    map('n', '<leader>gu', gitsigns.undo_stage_hunk)
    map('n', '<leader>gh', gitsigns.preview_hunk)
    map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>gg', gitsigns.toggle_signs)
    map('n', '<leader>gt', gitsigns.toggle_current_line_blame)
    map('n', '<leader>gd', gitsigns.diffthis)
    map('n', '<leader>gD', function() gitsigns.diffthis('~') end)

    -- Text objects
    map({'o', 'x'}, 'ih', '<cmd>Gitsigns select_hunk<cr>')
  end
})
