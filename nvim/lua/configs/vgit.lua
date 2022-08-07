local map = vim.keymap.set
local opts = { silent = true }

require('vgit').setup({
  settings = {
    live_blame = {
      enabled = false,
    },
  },
})

map('n', ']h', ':VGit hunk_down<cr>', opts)
map('n', '[h', ':VGit hunk_up<cr>', opts)
map('n', '<leader>gs', ':VGit buffer_hunk_stage<cr>', opts)
map('n', '<leader>gu', ':VGit buffer_hunk_reset<cr>', opts)
map('n', '<leader>gh', ':VGit buffer_hunk_preview<cr>', opts)
map('n', '<leader>gb', ':VGit buffer_blame_preview<cr>', opts)
map('n', '<leader>gg', ':VGit buffer_gutter_blame_preview<cr>', opts)
map('n', '<leader>gd', ':VGit buffer_diff_preview<cr>', opts)
map('n', '<leader>gp', ':VGit project_diff_preview<cr>', opts)
map('n', '<leader>gl', ':VGit buffer_history_preview<cr>', opts)
map('n', '<leader>gr', ':VGit buffer_reset<cr>', opts)
map('n', '<leader>gx', ':VGit toggle_diff_preference<cr>', opts)
map('n', '<leader>gt', ':VGit toggle_live_blame<cr>', opts)
