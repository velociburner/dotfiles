-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-----------Lua globals----------- {{{
map = vim.keymap.set
execute = vim.api.nvim_command
opts = {noremap = true, silent = true}
exopts = {noremap = true, silent = true, expr = true}
waitopts = {noremap = true, silent = true, nowait = true}
-- }}}

-----------General----------- {{{
vim.opt.number = true
vim.opt.showcmd = false
vim.wo.signcolumn = 'yes'
vim.opt.errorbells = false
vim.opt.ttimeoutlen = 5

vim.opt.directory = vim.fn.expand('~/swapfiles')
vim.g.python3_host_prog = vim.fn.expand('~/anaconda3/bin/python3')

vim.opt.termguicolors = true
-- }}}

-----------Autocomplete----------- {{{
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = 'list:longest,full'

vim.opt.updatetime = 100
vim.opt.shortmess:append('c')
-- }}}

-----------Search Options----------- {{{
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
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
vim.opt.runtimepath:prepend('~/.local/share/nvim/site/pack/packer/start/vim-snippets')
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
--}}}
