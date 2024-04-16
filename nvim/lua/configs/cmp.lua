local cmp = require('cmp')

cmp.setup({
  enabled = function ()
    -- disable completion if the cursor is in a comment
    local context = require("cmp.config.context")
    return not context.in_syntax_group('Comment') and not context.in_treesitter_capture('comment')
  end,
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
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    })
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
