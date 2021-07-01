"Config options: https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/

"Ctrl-I      Tab
"Ctrl-[      Esc
"Ctrl-M      Enter
"Ctrl-H      Backspace

"Cheat sheet: https://devhints.io/vimscript
"<BS>           Backspace
"<Tab>          Tab
"<CR>           Enter
"<Enter>        Enter
"<Return>       Enter
"<Esc>          Escape
"<Space>        Space
"<Up>           Up arrow
"<Down>         Down arrow
"<Left>         Left arrow
"<Right>        Right arrow
"<F1> - <F12>   Function keys 1 to 12
"#1, #2..#9,#0  Function keys F1 to F9, F10
"<Insert>       Insert
"<Del>          Delete
"<Home>         Home
"<End>          End
"<PageUp>       Page-Up
"<PageDown>     Page-Down
"<bar>          the '|' character, which otherwise needs to be escaped '\|'

"===========UTF-8===========
set encoding=utf-8

"===========Basic===========
set nocompatible
set directory=~/swapfiles
set number
set noerrorbells
set visualbell
set ttimeoutlen=5
"let mapleader = "<Space>"
"inoremap jk <Esc>

" WSL yank support
set clipboard=unnamedplus

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

"===========Plugins===========
" call plug#begin('~/vimfiles/plugged')
call plug#begin('~/.vim/plugged')

"---Making my life easier---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'preservim/nerdtree'

"---Linting---
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic' " must also install checkers separately: flake8, lacheck, etc.

"---Snippets---
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"---Tags---
Plug 'ludovicchabant/vim-gutentags'

"---VimTex---
Plug 'lervag/vimtex'

"---Autocomplete---
Plug 'vim-scripts/AutoComplPop'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'davidhalter/jedi-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---Fuzzy finder---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

"---Git---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"---Style---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'doums/darcula'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

"NERDtree
nnoremap <leader>nn :NERDTree<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>

let NERDTreeNaturalSort = 1
let NERDTreeWinSize = 39

"Auto-pairs
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

"Commentary
nmap <C-/> mzgcc`zll
imap <C-/> <Esc>mzgcc`zlla

"VimTex
nnoremap <Space><Space> a<Space><Esc>h

"Darcula
set t_Co=256
set termguicolors
colorscheme darcula
"highlight Normal guibg=NONE ctermbg=NONE

"Palenight
autocmd BufRead *.tex colorscheme palenight


"Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#syntastic#enabled = 1
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.colnr = ' ㏇:'
" let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.colnr = ' Col:'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = ' ␊:'
" let g:airline_symbols.linenr = ' ␤:'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ' Ln:'
let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" set guifont=Source\ Code\ Pro\ for\ Powerline

" " powerline symbols
" " let g:airline_left_sep = ''
" " let g:airline_left_alt_sep = ''
" " let g:airline_right_sep = ''
" " let g:airline_right_alt_sep = ''
" " let g:airline_symbols.branch = ''
" " let g:airline_symbols.readonly = ''
" " let g:airline_symbols.linenr = ''

"Easymotion
let g:EasyMotion_smartcase = 1

" Gif config
map <Space>h <Plug>(easymotion-linebackward)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>l <Plug>(easymotion-lineforward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" <Leader>f{char} to move to {char}
map  <leader>F <Plug>(easymotion-bd-f)
nmap <leader>F <Plug>(easymotion-overwin-f)

" <leader>s{char}{char} to move to {char}{char}
nmap <leader>S <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>W <Plug>(easymotion-bd-w)
nmap <leader>W <Plug>(easymotion-overwin-w)

"Fuzzy finder
nnoremap <silent> <leader>f :Files<cr>

"Flake8
"let g:flake8_show_in_file=1  " show
let g:flake8_quickfix_height=3

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_loc_list_height = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let syntastic_warning_symbol = "W>"

"SnipMate
" let g:snipMate = { 'snippet_version' : 1 }

"Ultisnips
" let g: UltiSnipsEditSplit="vertical"

"Gutentags
" let g:gutentags_ctags_executable = 'mnt/c/Users/joshb/Downloads/ctags-p5.9.20210613.0-x64/ctags.exe'

"AutoComplPop
set shortmess+=c
let g:acp_completeOption = '.,w,b,u,t'
" let g:acp_behaviorKeywordLength = 1

"Gitgutter
set updatetime=100
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

"===========Quick save and quit===========
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader><leader>q :wq<cr>

"===========Autocomplete===========
"Command mode
set wildmenu
" set wildmode=longest:full,full
set wildmode=longest:list,full

"Insert mode
set completeopt=menu,preview

"Insert mode
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"===========Spell check===========
"set spell
nnoremap <silent> <leader>c :set spell!<cr>

"===========Autoread===========
set autoread
au FocusGained,BufEnter * checktime
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"===========Cursor===========
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"===========Custom text objects===========
vnoremap af :<C-U>silent! normal! [zV]z<CR>
omap af :normal Vaf<CR>

onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

function! s:IndTxtObj(inner)
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") !~ "^\\s*$"
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      -
      let p = line(".") - 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
      +
      let p = line(".") + 1
      let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    normal! $
  endif
endfunction

"===========Tabs===========
nnoremap gn :tabnew<cr>
nnoremap <leader><leader>t :tab split<cr>

"===========Change inner===========
nnoremap ci( f(ci(
nnoremap ci) F)ci)

nnoremap ci{ f{ci{
nnoremap ci} F}ci}

nnoremap ci[ f[ci[
nnoremap ci] F]ci]
nnoremap cin ci]
nnoremap can ca]

"===========Move lines===========
nnoremap <C-S-j> mz:m+<cr>`z
nnoremap <C-S-k> mz:m-2<cr>`z
vnoremap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z

"===========Add lines===========
nnoremap <Space>o mzo<Esc>k`z
nnoremap <Space>O mzO<Esc>j`z
inoremap <S-CR> <Esc>o

"===========Search options===========
set hlsearch
nnoremap <silent> <leader>z :noh<cr>
set ignorecase
set incsearch
set smartcase

"===========Find and replace============
set gdefault

"===========Folds===========
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

"augroup AutoSaveGroup
"  autocmd!
"  " view files are about 500 bytes
"  " bufleave but not bufwinleave captures closing 2nd tab
"  " nested is needed by bufwrite* (if triggered via other autocmd)
"  " BufHidden for for compatibility with `set hidden`
"  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
"  autocmd BufWinEnter ?* silent! loadview
"augroup end

set foldmethod=indent
set foldlevel=99
set foldnestmax=1
set nofoldenable

"===========Splits===========
set splitbelow
set splitright
set fillchars+=vert:\ 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-J> <Esc><C-W><C-J>
inoremap <C-K> <Esc><C-W><C-K>
inoremap <C-L> <Esc><C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

nnoremap <leader>r <C-W>R

" nnoremap <C-=> <C-W>2>
" nnoremap <C-_> <C-W>2<
" inoremap <C-=> <Esc><C-W>2>a
" inoremap <C-_> <Esc><C-W>2<a
nnoremap <Right> <C-W>2>
nnoremap <Left> <C-W>2<

" nnoremap <silent> <C-S-+> :resize +2<cr>
" nnoremap <silent> <C-S-_> :resize -2<cr>
" inoremap <silent> <C-S-+> <Esc>:resize +2<cr>a
" inoremap <silent> <C-S-_> <Esc>:resize -2<cr>a
nnoremap <silent> <Up> :resize +2<cr>
nnoremap <silent> <Down> :resize -2<cr>

nnoremap <leader><leader>v :tabnew ~/.vimrc<cr>
nnoremap <silent> <leader>t :vert term<cr>

"===========Buffers===========
nnoremap <silent> <leader>b :bn<cr>
nnoremap <silent> <leader>B :bp<cr>

"===========Netrw===========
"https://shapeshed.com/vim-netrw/
"let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 39

nnoremap <leader>v :Vex<cr>

"===========Indentation===========
set textwidth=119
set colorcolumn=80
set shiftround
set smarttab
set expandtab
set autoindent

"LaTeX
au FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2

"PEP 8
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Whitespace
set listchars=trail:«
set list

"===========Import statements===========
"python
nnoremap <leader>i mz"zyiwgg/^$<cr>oimport <Esc>"zp`z:noh<cr>

"===========Project Euler===========
cabbrev euler -1read template.txt
