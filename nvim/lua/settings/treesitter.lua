-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
require('nvim-treesitter.configs').setup {
    -- Modules and its options go here
    ensure_installed = {'bash', 'json', 'lua', 'python', 'vim'},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'gni',
            scope_incremental = 'gns',
            node_decremental = 'gnd',
        },
    },
    textobjects = { enable = true },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
