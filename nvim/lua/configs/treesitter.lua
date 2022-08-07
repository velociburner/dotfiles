-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
require('nvim-treesitter.configs').setup {
  -- Modules and its options go here
  ensure_installed = {'bash', 'c', 'cpp', 'haskell', 'json', 'lua', 'python', 'query', 'vim'},

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
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['ak'] = '@block.outer',
        ['id'] = '@call.inner',
        ['ad'] = '@call.outer',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['am'] = '@comment.outer',
        ['iy'] = '@conditional.inner',
        ['ay'] = '@conditional.outer',
        ['iz'] = '@frame.inner',
        ['az'] = '@frame.outer',
        ['if'] = '@function.inner',
        ['af'] = '@function.outer',
        ['iN'] = '@function.name',
        ['io'] = '@loop.inner',
        ['ao'] = '@loop.outer',
        ['as'] = '@statement.outer',
        ['ij'] = '@table.field',
        ['ik'] = '@table.key',
        ['iv'] = '@table.value'
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
