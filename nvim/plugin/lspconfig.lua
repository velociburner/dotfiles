local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Add lsp_signature on attach
  require("lsp_signature").on_attach({
    bind = true,
    max_height = 0,
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<localleader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<localleader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<localleader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<localleader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('x', '<localleader>ca', '<Esc><cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', '<localleader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<localleader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<localleader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<localleader>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
  buf_set_keymap('x', '<localleader>f', '<Esc><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

  -- Don't clear the augroup so that a new one is defined for each buffer an
  -- LSP attaches to after it attaches
  vim.api.nvim_create_augroup("DocumentHighlight", { clear = false })
  vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    group = "DocumentHighlight",
    buffer = bufnr,
    command = "lua vim.lsp.buf.document_highlight()"
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = "DocumentHighlight",
    buffer = bufnr,
    command = "lua vim.lsp.buf.clear_references()"
  })

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pylsp', 'clangd', 'hls', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    single_file_support = true,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        -- Get the language server to recognize the `vim` global
        diagnostics = {
          globals = {'vim'}
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      }
    }
  }
end
