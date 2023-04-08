local cmp = require('cmp')

cmp.setup({
  -- enabled = function ()
  --   -- disable completion if the cursor is `Comment` syntax group.
  --   return not cmp.config.context.in_syntax_group('Comment')
  -- end,
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 5 },
  },
  {
    { name = 'buffer', max_item_count = 5, keyword_length = 4 },
    { name = 'path', max_item_count = 5 },
    { name = 'nvim_lua' }
  }),
  experimental = {
    ghost_text = true,
  }
})

-- If you want insert `(` after select function or method item
cmp.event:on( 'confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
