return require('packer').startup(function()
  ---Packer---
  use 'wbthomason/packer.nvim'

  ---Making my life easier---
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'ggandor/lightspeed.nvim'
  use 'vim-scripts/ReplaceWithRegister'
  use { 'preservim/nerdtree', cmd = {'NERDTree', 'NERDTreeToggle'} }

  ---Text Objects---
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'
  use 'lukas-reineke/indent-blankline.nvim'

  ---Snippets---
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  ---Tags---
  use 'ludovicchabant/vim-gutentags' -- must also install ctags separately

  ---VimTex---
  use { 'lervag/vimtex', ft = {'tex', 'bibtex'} }

  ---LSP---
  -- use { 'neoclide/coc.nvim', branch = 'release' } -- requires nodejs and npm
  use 'neovim/nvim-lspconfig'

  ---Autocomplete---
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua'
    }
  }

  ---Fuzzy finder---
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' -- requires ripgrep for live grep

  ---Git---
  use 'tanvirtin/vgit.nvim'

  ---REPL---
  use 'jpalardy/vim-slime'

  ---Style---
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'navarasu/onedark.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
