-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-----------Load vimrc----------- {{{
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.g.packpath = vim.g.runtimepath
vim.cmd 'source ~/.vimrc'
-- }}}

-----------Basic----------- {{{
vim.opt.showcmd = false
vim.g.python3_host_prog = vim.fn.expand('~/anaconda3/bin/python3.8')

local map = vim.api.nvim_set_keymap
local execute = vim.api.nvim_command

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.compatible = false
vim.g.encoding = 'utf-8'
vim.g.directory = '~/swapfiles'
vim.g.hidden = true
vim.g.number = true
vim.g.errorbells = false
vim.g.visualbell = true
vim.g.ttimeoutlen = 5

vim.g.localleader = ','
map('n', ';', ':', {noremap = true})
map('n', '<leader>sv', ':source $MYVIMRC<cr>', {noremap = true})
map('n', '<leader>sl', ':<C-R><C-L><cr>', {noremap = true})
-- }}}

-----------Coc----------- {{{
-- Use <c-space> to trigger completion.
map('i', '<c-space>', 'coc#refresh()', {noremap = true, silent = true, expr = true})

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin

map('i', '<cr>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', {noremap = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map('n', '[d', '<Plug>(coc-diagnostic-prev)', {silent = true})
map('n', ']d', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo code navigation
map('n', 'gd', '<Plug>(coc-definition)', {silent = true})
map('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
map('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
map('n', '<space>gr', '<Plug>(coc-references)', {silent = true})

map('n', 'K', 'v:lua.show_documentation()', {noremap = true, silent = true, expr = true})

_G.show_documentation = function()
    local filetype = vim.bo.filetype

    if filetype == 'vim' or filetype == 'help' then
        execute('h ' .. vim.fn.expand('<cword>'))
    elseif vim.call('coc#rpc#ready') then
    -- elseif vim.fn['coc#rpc#ready']() then
        vim.fn.CocActionAsync('doHover')
    else
        execute('!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
    end
end

-- Highlight the symbol and its references when holding the cursor.
vim.cmd('autocmd CursorHold * silent call CocActionAsync("highlight")')

-- Symbol renaming
map('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Formatting selected code.
map('x', '<leader>cf', '<Plug>(coc-format-selected)', {})
map('n', '<leader>cf', '<Plug>(coc-format-selected)', {})

vim.cmd [[
    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
]]

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
map('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {noremap = false, silent = true})
map('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {noremap = false, silent = true})

-- Remap keys for applying codeAction to the current buffer.
map('n', '<leader>ca', '<Plug>(coc-codeaction)', {noremap = false, silent = true})
-- Apply AutoFix to problem on the current line.
map('n', '<leader>cl', '<Plug>(coc-fix-current)', {noremap = false, silent = true})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map('x', 'if', '<Plug>(coc-funcobj-i)', {noremap = false, silent = true})
map('o', 'if', '<Plug>(coc-funcobj-i)', {noremap = false, silent = true})
map('x', 'af', '<Plug>(coc-funcobj-a)', {noremap = false, silent = true})
map('o', 'af', '<Plug>(coc-funcobj-a)', {noremap = false, silent = true})
map('x', 'ic', '<Plug>(coc-classobj-i)', {noremap = false, silent = true})
map('o', 'ic', '<Plug>(coc-classobj-i)', {noremap = false, silent = true})
map('x', 'ac', '<Plug>(coc-classobj-a)', {noremap = false, silent = true})
map('o', 'ac', '<Plug>(coc-classobj-a)', {noremap = false, silent = true})

-- Add `:Format` command to format current buffer.
vim.cmd [[
    command! -nargs=0 Format :call CocAction('format')
]]

-- Add `:Fold` command to fold current buffer.
vim.cmd [[
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
]]

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd [[
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
]]

-- Mappings for CocList

-- Show all diagnostics.
map('n', '<leader>cd', ':<C-u>CocList diagnostics<cr>',
    {noremap = true, silent = true, nowait = true})
-- Manage extensions.
map('n', '<leader>ce', ':<C-u>CocList extensions<cr>',
    {noremap = true, silent = true, nowait = true})
-- Show commands.
map('n', '<leader>cc', ':<C-u>CocList commands<cr>',
    {noremap = true, silent = true, nowait = true})
-- Find symbol of current document.
map('n', '<leader>co', ':<C-u>CocList outline<cr>',
    {noremap = true, silent = true, nowait = true})
-- Search workspace symbols.
map('n', '<leader>cs', ':<C-u>CocList -I symbols<cr>',
    {noremap = true, silent = true, nowait = true})
-- Do default action for next item.
map('n', '<leader>cn', ':<C-u>CocNext<cr>',
    {noremap = true, silent = true, nowait = true})
-- Do default action for previous item.
map('n', '<leader>cp', ':<C-u>CocPrev<cr>',
    {noremap = true, silent = true, nowait = true})
-- Resume latest coc list.
map('n', '<leader>cr', ':<C-u>CocListResume<cr>',
    {noremap = true, silent = true, nowait = true})
-- }}}

----------Telescope----------- {{{
-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
-- }}}

-----------Git----------- {{{
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
-- }}}

-----------Indent Blank Line----------- {{{
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    --space_char_blankline = " ",
    buftype_exclude = {"terminal"},
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
-- }}}

-----------Treesitter----------- {{{
-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
require('nvim-treesitter.configs').setup {
    -- Modules and its options go here
    ensure_installed = { "python", "json", "lua", "vim" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gni",
            scope_incremental = "gns",
            node_decremental = "gnd",
        },
    },
    textobjects = { enable = true },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- }}}
