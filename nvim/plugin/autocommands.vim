augroup AutoRead
    autocmd!
    autocmd FocusGained,BufEnter * checktime
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 500 })
augroup END

augroup IncsearchHighlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd Cmdlineleave /,\? :set nohlsearch
augroup END
