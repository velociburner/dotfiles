require('iron').core.set_config {
  preferred = {
    python = "ipython"
  }
}

map('n', '<leader>ii', ':IronRepl<cr>', opts)
map('n', '<leader>ih', ':IronReplHere<cr>', opts)
map('n', '<leader>ir', ':IronRestart<cr>', opts)
map('n', '<leader>iw', ':IronWatchCurrentFile<cr>', opts)
map('n', '<leader>iu', ':IronUnwatchCurrentFile<cr>', opts)

map('n', '<localleader>t', '<Plug>(iron-send-motion)', {})
map('v', '<localleader>v', '<Plug>(iron-visual-send)', {})
map('n', '<localleader>r', '<Plug>(iron-repeat-cmd)', {})
map('n', '<localleader>l', '<Plug>(iron-send-line)', {})
map('n', '<localleader><cr>', '<Plug>(iron-cr)', {})
map('n', '<localleader>i', '<Plug>(iron-interrupt)', {})
map('n', '<localleader>q', '<Plug>(iron-exit)', {})
map('n', '<localleader>c', '<Plug>(iron-clear)', {})
