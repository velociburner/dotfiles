-- https://github.com/rockerBOO/awesome-neovim#tree-sitter-supported-colorscheme
require('nvim-treesitter.configs').setup {
  -- Modules and its options go here
  ensure_installed = {'bash', 'c', 'cpp', 'haskell', 'json', 'lua', 'python', 'query', 'vim', 'vimdoc'},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<M-o>',
      node_incremental = '<M-o>',
      scope_incremental = '<M-s>',
      node_decremental = '<M-i>',
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['iA'] = '@attribute.inner',
        ['aA'] = '@attribute.outer',
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
        ['<localleader>sc'] = '@class.outer',
        ['<localleader>sm'] = '@comment.outer',
        ['<localleader>sy'] = '@conditional.outer',
        ['<localleader>sf'] = '@function.outer',
        ['<localleader>so'] = '@loop.outer',
        ['<localleader>sa'] = '@parameter.inner',
        ['<localleader>sj'] = '@table.field',
        ['<localleader>sk'] = '@table.key',
        ['<localleader>sv'] = '@table.value',
      },
      swap_previous = {
        ['<localleader>sC'] = '@class.outer',
        ['<localleader>sM'] = '@comment.outer',
        ['<localleader>sY'] = '@conditional.outer',
        ['<localleader>sF'] = '@function.outer',
        ['<localleader>sO'] = '@loop.outer',
        ['<localleader>sA'] = '@parameter.inner',
        ['<localleader>sJ'] = '@table.field',
        ['<localleader>sK'] = '@table.key',
        ['<localleader>sV'] = '@table.value',
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]c"] = "@class.outer",
        ["]m"] = "@comment.outer",
        ["]y"] = "@conditional.outer",
        ["]f"] = "@function.outer",
        ["]o"] = "@loop.outer",
        ["]a"] = "@parameter.inner",
        ["]j"] = "@table.field",
        ["]k"] = "@table.key",
        ["]v"] = "@table.value",
      },
      goto_next_end = {
        ["]C"] = "@class.outer",
        ["]M"] = "@comment.outer",
        ["]Y"] = "@conditional.outer",
        ["]F"] = "@function.outer",
        ["]O"] = "@loop.outer",
        ["]A"] = "@parameter.inner",
        ["]J"] = "@table.field",
        ["]K"] = "@table.key",
        ["]V"] = "@table.value",
      },
      goto_previous_start = {
        ["[c"] = "@class.outer",
        ["[m"] = "@comment.outer",
        ["[y"] = "@conditional.outer",
        ["[f"] = "@function.outer",
        ["[o"] = "@loop.outer",
        ["[a"] = "@parameter.inner",
        ["[j"] = "@table.field",
        ["[k"] = "@table.key",
        ["[v"] = "@table.value",
      },
      goto_previous_end = {
        ["[C"] = "@class.outer",
        ["[M"] = "@comment.outer",
        ["[Y"] = "@conditional.outer",
        ["[F"] = "@function.outer",
        ["[O"] = "@loop.outer",
        ["[A"] = "@parameter.inner",
        ["[J"] = "@table.field",
        ["[K"] = "@table.key",
        ["[V"] = "@table.value",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<localleader>pf"] = "@function.outer",
        ["<localleader>pc"] = "@class.outer",
      },
    },
  },
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
