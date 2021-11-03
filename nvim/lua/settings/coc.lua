-- Use <c-space> to trigger completion.
map('i', '<c-space>', 'coc#refresh()', exopts)

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin

map('i', '<cr>', 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', exopts)

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map('n', '[d', '<Plug>(coc-diagnostic-prev)', {silent = true})
map('n', ']d', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo code navigation
map('n', 'gd', '<Plug>(coc-definition)', {silent = true})
map('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
map('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
map('n', '<space>gr', '<Plug>(coc-references)', {silent = true})

map('n', 'K', ':lua show_documentation()<cr>', opts)

show_documentation = function()
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
map('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {silent = true})
map('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {silent = true})

-- Remap keys for applying codeAction to the current buffer.
map('n', '<leader>ca', '<Plug>(coc-codeaction)', {silent = true})
-- Apply AutoFix to problem on the current line.
map('n', '<leader>cl', '<Plug>(coc-fix-current)', {silent = true})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map('x', 'if', '<Plug>(coc-funcobj-i)', {silent = true})
map('o', 'if', '<Plug>(coc-funcobj-i)', {silent = true})
map('x', 'af', '<Plug>(coc-funcobj-a)', {silent = true})
map('o', 'af', '<Plug>(coc-funcobj-a)', {silent = true})
map('x', 'ic', '<Plug>(coc-classobj-i)', {silent = true})
map('o', 'ic', '<Plug>(coc-classobj-i)', {silent = true})
map('x', 'ac', '<Plug>(coc-classobj-a)', {silent = true})
map('o', 'ac', '<Plug>(coc-classobj-a)', {silent = true})

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
map('n', '<leader>cd', ':<C-u>CocList diagnostics<cr>', waitopts)
-- Manage extensions.
map('n', '<leader>ce', ':<C-u>CocList extensions<cr>', waitopts)
-- Show commands.
map('n', '<leader>cc', ':<C-u>CocList commands<cr>', waitopts)
-- Find symbol of current document.
map('n', '<leader>co', ':<C-u>CocList outline<cr>', waitopts)
-- Search workspace symbols.
map('n', '<leader>cs', ':<C-u>CocList -I symbols<cr>', waitopts)
-- Do default action for next item.
map('n', '<leader>cn', ':<C-u>CocNext<cr>', waitopts)
-- Do default action for previous item.
map('n', '<leader>cp', ':<C-u>CocPrev<cr>', waitopts)
-- Resume latest coc list.
map('n', '<leader>cr', ':<C-u>CocListResume<cr>', waitopts)
