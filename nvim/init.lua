-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-----------Runtimepath----------- {{{
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.g.packpath = vim.g.runtimepath
-- }}}

-----------Lua globals----------- {{{
map = vim.api.nvim_set_keymap
execute = vim.api.nvim_command
opts = {noremap = true, silent = true}
exopts = {noremap = true, silent = true, expr = true}
waitopts = {noremap = true, silent = true, nowait = true}
-- }}}

-----------Settings----------- {{{
require('settings.plugins')
require('settings.keymaps')
require('settings.general')
require('settings.lualine')
require('settings.bufferline')
require('settings.coc')
require('settings.telescope')
require('settings.vgit')
require('settings.indentblankline')
require('settings.treesitter')
-- }}}
