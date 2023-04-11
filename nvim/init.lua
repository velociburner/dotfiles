-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-----------Lazy----------- {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('configs.lazy')
-- }}}

-----------General----------- {{{
vim.opt.number = true
vim.opt.showcmd = false
vim.wo.signcolumn = 'yes'
vim.opt.errorbells = false
vim.opt.ttimeoutlen = 5

vim.opt.directory = vim.fn.expand('~/swapfiles')
vim.g.python3_host_prog = vim.fn.expand('~/miniconda3/bin/python3')

vim.opt.termguicolors = true

vim.opt.mouse = ""
-- }}}

-----------Autocomplete----------- {{{
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = 'longest:full'

vim.opt.updatetime = 100
vim.opt.shortmess:append('c')
-- }}}

-----------Search Options----------- {{{
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}}

-----------Conceal----------- {{{
vim.wo.conceallevel = 1
vim.wo.concealcursor = 'n'
-- }}}

-----------Folds----------- {{{
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 2
vim.opt.foldopen:remove('block')
vim.opt.foldenable = false
-- }}}

-----------Splits----------- {{{
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = {vert = ' '}
-- }}}

-----------Indentation----------- {{{
vim.bo.textwidth = 119
vim.wo.colorcolumn = '80'
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = {trail = '«'}
-- }}}

-----------Snippets----------- {{{
vim.g.UltiSnipsEnableSnipMate = 0
-- }}}

-----------NERDTree----------- {{{
vim.g.NERDTreeNaturalSort = 1
vim.g.NERDTreeWinSize = 39
-- }}}

-----------Vim Slime----------- {{{
vim.g.slime_target = 'tmux'
vim.g.slime_default_config = {socket_name = 'default', target_pane = ':.2'}
-- }}}

-----------Vimtex----------- {{{
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
vim.g.vimtex_syntax_conceal_disable = 1
--}}}
