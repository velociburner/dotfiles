local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

---Making my life easier---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ggandor/lightspeed.nvim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug ('preservim/nerdtree', {on = {'NERDTree', 'NERDTreeToggle'}})

---Text Objects---
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'lukas-reineke/indent-blankline.nvim'

---Snippets---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

---Tags---
Plug 'ludovicchabant/vim-gutentags' -- must also install ctags separately

---VimTex---
Plug ('lervag/vimtex', {['for'] = {'tex', 'bibtex'}})

---Autocomplete---
Plug ('neoclide/coc.nvim', {branch = 'release'}) -- requires nodejs and npm

---Fuzzy finder---
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' -- requires ripgrep for live grep

---Git---
Plug 'tanvirtin/vgit.nvim'

---Style---
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
-- Plug 'kyazdani42/nvim-web-devicons'
Plug 'navarasu/onedark.nvim'
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

vim.call('plug#end')
