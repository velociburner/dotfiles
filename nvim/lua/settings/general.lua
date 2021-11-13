-----------General----------- {{{
vim.opt.number = true
vim.opt.showcmd = false
vim.opt.errorbells = false
vim.opt.ttimeoutlen = 5

vim.opt.directory = vim.fn.expand('~/swapfiles')
vim.g.python3_host_prog = vim.fn.expand('~/anaconda3/bin/python3')

vim.opt.termguicolors = true
vim.cmd 'colorscheme onedark'
-- }}}

-----------Autocomplete----------- {{{
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = 'list:longest,full'

vim.opt.updatetime = 100
vim.opt.shortmess:append('c')
-- }}}

-----------Autoread----------- {{{
vim.cmd [[
  augroup AutoRead
    autocmd!
    autocmd FocusGained,BufEnter * checktime
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END
]]
-- }}}

-----------Search Options----------- {{{
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd [[
  augroup IncsearchHighlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd Cmdlineleave /,\? :set nohlsearch
  augroup END
]]
-- }}}

-----------Folds----------- {{{
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 2
vim.opt.foldopen:remove('block')
vim.opt.foldenable = false

vim.cmd [[
  augroup Folding
    autocmd!
    autocmd FileType vim,lua setlocal foldmethod=marker
  augroup END
]]
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

vim.cmd [[
  augroup Indentation
    autocmd!
    autocmd FileType tex,lua setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119
    autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
    autocmd FileType java,c,cpp setlocal softtabstop=4 shiftwidth=4 textwidth=119 colorcolumn=100
    autocmd FileType vim,sh setlocal shiftwidth=4
  augroup END
]]
-- }}}

-----------Snippets----------- {{{
vim.g.UltiSnipsEnableSnipMate = 0
vim.opt.runtimepath:prepend('~/.local/share/nvim/site/pack/packer/start/vim-snippets')
vim.opt.runtimepath:prepend('~/dotfiles')
-- }}}

-----------NERDTree----------- {{{
vim.g.NERDTreeNaturalSort = 1
vim.g.NERDTreeWinSize = 39
-- }}}

-----------Vim Slime----------- {{{
vim.g.slime_target = 'tmux'
vim.g.slime_default_config = {socket_name = 'default', target_pane = ':.2'}
--}}}
