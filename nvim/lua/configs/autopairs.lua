-- https://xlwe.medium.com/setting-up-neovim-for-web-development-70c57c3d7d61
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

npairs.add_rules {

-- before   insert  after
--  (|)     ( |)	( | )
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']'),
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex_check("%%"))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- disable add newline when press <cr>
    :with_cr(cond.none())
}
