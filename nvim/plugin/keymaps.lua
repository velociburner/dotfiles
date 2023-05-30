local map = vim.keymap.set
local opts = { silent = true }

-----------Basic----------- {{{
vim.g.maplocalleader = ','
map('n', ';', ':', {})
map('x', ';', ':', {})
map('x', '.', ':norm! .<cr>', opts)
map('n', '<leader>sc', ':luafile $MYVIMRC<cr>', opts)
map('n', '<leader>sl', ':lua <C-R><C-L><cr>', {})
map('n', '<leader>sv', ':<C-R><C-L><cr>', {})
-- }}}

-----------Save and quit----------- {{{
map('n', '<leader>w', ':w<cr>', opts)
map('n', '<leader>q', ':q<cr>', opts)
map('n', '<leader>x', ':x<cr>', opts)
-- }}}

-----------Tabs----------- {{{
map('n', '<Space>t', ':tabnew<cr>', opts)
map('n', '<leader><leader>t', ':tab split<cr>', opts)
map('n', ']t', 'gt', opts)
map('n', '[t', 'gT', opts)
-- }}}

-----------Splits----------- {{{
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-k>', '<C-W><C-k>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)
map('n', '<C-H>', '<C-W><C-H>', opts)

map('n', '<leader>R', '<C-W>R', opts)
map('n', '-', ':sp<cr>', opts)
map('n', '<Bar>', ':vs<cr>', opts)

map('n', '<Right>', '<C-W>2>', opts)
map('n', '<Left>', '<C-W>2<', opts)
map('n', '<Up>', ':resize +2<cr>', opts)
map('n', '<Down>', ':resize -2<cr>', opts)
-- }}}

-----------Buffers----------- {{{
-- map('n', ']b', ':bnext<cr>`"', opts)
-- map('n', '[b', ':bprevious<cr>`"', opts)
map('n', '<BS>', '<C-^>', opts)
-- }}}

-----------Terminal----------- {{{
map('t', '<Esc>', '<C-\\><C-N>', opts)
--}}}

-----------Quickfix and Location list----------- {{{
map('n', ']q', ':cnext<cr>', opts)
map('n', '[q', ':cprevious<cr>', opts)

map('n', ']l', ':lnext<cr>', opts)
map('n', '[l', ':lprevious<cr>', opts)
-- }}}

-----------Spelling----------- {{{
map('n', '<leader>ss', ':set spell!<cr>', opts)
vim.cmd 'iabbrev slef self'
vim.cmd 'iabbrev functino function'
-- }}}

-----------Motions----------- {{{
map('n', 'j', 'gj', opts)
map('x', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('x', 'k', 'gk', opts)
map('', 'gh', '^', opts)
map('', 'gl', '$', opts)

map('i', '<M-b>', '<C-O>b', opts)
map('i', '<M-B>', '<C-O>B', opts)
map('i', '<M-w>', '<C-O>w', opts)
map('i', '<M-W>', '<C-O>W', opts)
map('i', '<M-e>', '<C-O>e<Right>', opts)
map('i', '<M-E>', '<C-O>E<Right>', opts)
-- }}}

-----------Text objects----------- {{{
map('x', 'ix', 'g_o^', opts)
map('o', 'ix', ':<C-u>normal vix<cr>', opts)
map('x', 'ax', '$o0', opts)
map('o', 'ax', ':<C-u>normal vax<cr>', opts)

map('n', ')', 'f)', opts)
map('n', '(', 'F(', opts)
-- }}}

-----------Comments----------- {{{
map('n', '<C-_>', 'gcc', { remap = true })
map('x', '<C-_>', 'gc', { remap = true })
-- }}}

-----------Move lines----------- {{{
map('n', '<Space>j', ':m.+1<cr>==', opts)
map('n', '<Space>k', ':m.-2<cr>==', opts)
map('v', '<C-j>', ":m'>+1<cr>gv=gv", opts)
map('v', '<C-k>', ":m'<-2<cr>gv=gv", opts)
-- }}}

-----------File edits----------- {{{
map('n', '<Space><Space>', 'a<Space><Esc>h', opts)
map('n', '<Space>o', 'mzo<Esc>k`z', opts)
map('n', '<Space>O', 'mzO<Esc>j`z', opts)

map('n', 'cp', 'yap<S-}>p', opts)

map('n', '<Space>p', '"0p', opts)
map('n', '<Space>P', '"0P', opts)
map('n', '<leader>p', '"*p', opts)
map('n', '<leader>P', '"*P', opts)
map('x', '<leader>p', '"*p', opts)
map('x', '<leader>P', '"*P', opts)

map('n', '<leader>y', '"*y', opts)
map('n', '<leader>Y', '"*Y', opts)
map('x', '<leader>y', '"*y', opts)
map('x', '<leader>Y', '"*Y', opts)

map('n', '<leader>es', ':UltiSnipsEdit<cr>', opts)
-- }}}

-----------Search----------- {{{
map('n', '<space>s', ':set hlsearch!<cr>', opts)
map('n', 'n', '"Nn"[v:searchforward] . "zz"', { silent = true, expr = true })
map('n', 'N', '"nN"[v:searchforward] . "zz"', { silent = true, expr = true })
-- }}}

-----------Marks----------- {{{
map('n', '`', "'", opts)
map('n', "'", '`', opts)
-- }}}

-----------NERDTree----------- {{{
map('n', '<leader>nn', ':NERDTree<cr>', opts)
map('n', '<leader>nt', ':NERDTreeToggle<cr>', opts)
map('n', '<leader>nm', ':NERDTreeMirror<cr>', opts)
-- }}}
