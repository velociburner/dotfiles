-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
require('nvim-treesitter.configs').setup {
  -- Modules and its options go here
  ensure_installed = {'bash', 'c', 'cpp', 'json', 'lua', 'python', 'query', 'vim'},

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
        ['ik'] = '@block.inner',
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
        ['io'] = '@loop.inner',
        ['ao'] = '@loop.outer',
        ['as'] = '@statement.outer',

        -- Or you can define your own textobjects like this
        ['iF'] = {
          python = '(function_definition) @function',
          cpp = '(function_definition) @function',
          c = '(function_definition) @function',
          java = '(method_declaration) @function',
        },
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
  },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
