return require('packer').startup(function(use)
  ---Packer---
  use 'wbthomason/packer.nvim'

  ---Making my life easier---
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use { 'windwp/nvim-autopairs', config = require('configs.autopairs') }
  use { 'ggandor/lightspeed.nvim', config = require('configs.lightspeed') }
  use 'vim-scripts/ReplaceWithRegister'
  use { 'preservim/nerdtree', cmd = {'NERDTree', 'NERDTreeToggle'} }

  ---Text Objects---
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'
  use { 'lukas-reineke/indent-blankline.nvim', config = require('configs.indentblankline') }

  ---Snippets---
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  ---Tags---
  -- use 'ludovicchabant/vim-gutentags' -- must also install ctags separately

  ---VimTex---
  use { 'lervag/vimtex', ft = {'tex', 'bibtex'} }

  ---LSP---
  -- use { 'neoclide/coc.nvim', branch = 'release' } -- requires nodejs and npm
  use { 'neovim/nvim-lspconfig', config = require('configs.lspconfig') }

  ---Autocomplete---
  use {
    'hrsh7th/nvim-cmp',
    config = require('configs.cmp'),
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua'
    }
  }
  use 'ray-x/lsp_signature.nvim'

  ---Fuzzy finder---
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', config = require('configs.telescope') } -- requires ripgrep for live grep

  ---Git---
  use { 'tanvirtin/vgit.nvim', config = require('configs.vgit') }

  ---REPL---
  use 'jpalardy/vim-slime'

  ---Style---
  use { 'nvim-lualine/lualine.nvim', config = require('configs.lualine') }
  use {'akinsho/bufferline.nvim', config = require('configs.bufferline'), requires = 'kyazdani42/nvim-web-devicons'}
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'folke/tokyonight.nvim'
  use { 'navarasu/onedark.nvim', config = require('configs.onedark') }
  use { 'nvim-treesitter/nvim-treesitter', config = require('configs.treesitter'), run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
end)
