local function src_cfg(file)
  return string.format("require('configs.%s')", file)
end

return require('packer').startup(function(use)
  ---Packer---
  use 'wbthomason/packer.nvim'

  ---Color scheme---
  use { 'navarasu/onedark.nvim', config = src_cfg('onedark') }

  ---Making my life easier---
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use { 'numToStr/Comment.nvim', config = src_cfg('comment') }
  use { 'windwp/nvim-autopairs', config = src_cfg('autopairs') }
  use { 'ggandor/lightspeed.nvim', config = src_cfg('lightspeed') }
  use 'vim-scripts/ReplaceWithRegister'
  use { 'preservim/nerdtree', cmd = {'NERDTree', 'NERDTreeToggle'} }

  ---LaTeX---
  use { 'lervag/vimtex', ft = {'tex', 'bibtex'} }

  ---LSP---
  use { 'neovim/nvim-lspconfig', config = src_cfg('lspconfig') }
  use { 'mfussenegger/nvim-dap', config = src_cfg('dap') }
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'

  ---Autocomplete---
  use {
    'hrsh7th/nvim-cmp', config = src_cfg('cmp'),
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua'
    }
  }
  use 'ray-x/lsp_signature.nvim'

  ---Snippets---
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  ---Fuzzy finder---
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', config = src_cfg('telescope') }

  ---Git---
  use { 'tanvirtin/vgit.nvim', config = src_cfg('vgit') }

  ---REPL---
  use 'jpalardy/vim-slime'

  ---Statusline---
  use { 'nvim-lualine/lualine.nvim', config = src_cfg('lualine') }
  use { 'akinsho/bufferline.nvim', config = src_cfg('bufferline'),
    requires = 'kyazdani42/nvim-web-devicons'
  }

  ---Text Objects---
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'
  use { 'lukas-reineke/indent-blankline.nvim', config = src_cfg('indentblankline') }

  ---Treesitter---
  use { 'nvim-treesitter/nvim-treesitter', config = src_cfg('treesitter'),
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
end)
