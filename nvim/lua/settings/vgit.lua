require('vgit').setup({
  controller = {
    blames_enabled = false,
  },
})

map('n', ']h', ':VGit hunk_down<cr>', {noremap = true, silent = true})
map('n', '[h', ':VGit hunk_up<cr>', {noremap = true, silent = true})
map('n', '<leader>gs', ':VGit buffer_hunk_stage<cr>', {noremap = true, silent = true})
map('n', '<leader>gu', ':VGit buffer_hunk_reset<cr>', {noremap = true, silent = true})
map('n', '<leader>gh', ':VGit buffer_hunk_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gb', ':VGit buffer_blame_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gg', ':VGit buffer_gutter_blame_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gd', ':VGit buffer_diff_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gp', ':VGit project_diff_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gl', ':VGit buffer_history_preview<cr>', {noremap = true, silent = true})
map('n', '<leader>gr', ':VGit buffer_reset<cr>', {noremap = true, silent = true})
map('n', '<leader>gx', ':VGit toggle_diff_preference<cr>', {noremap = true, silent = true})
map('n', '<leader>gt', ':VGit toggle_buffer_blames<cr>', {noremap = true, silent = true})
