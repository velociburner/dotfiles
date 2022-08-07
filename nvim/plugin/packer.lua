return require('packer').startup(function(use)
  ---Packer---
  use 'wbthomason/packer.nvim'

  ---Color scheme---
  use { 'navarasu/onedark.nvim',
    config = function() require('configs.onedark') end
  }

  ---Making my life easier---
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use { 'windwp/nvim-autopairs',
    config = function() require('configs.autopairs') end
  }
  use { 'ggandor/lightspeed.nvim',
    config = function() require('configs.lightspeed') end
  }
  use 'vim-scripts/ReplaceWithRegister'
  use { 'preservim/nerdtree',
    cmd = {'NERDTree', 'NERDTreeToggle'}
  }

  ---LaTeX---
  use { 'lervag/vimtex',
    ft = {'tex', 'bibtex'}
  }

  ---LSP---
  use { 'neovim/nvim-lspconfig',
    config = function() require('configs.lspconfig') end
  }

  ---Autocomplete---
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('configs.cmp') end,
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
  use { 'nvim-telescope/telescope.nvim',
    config = function() require('configs.telescope') end
  }

  ---Git---
  use { 'tanvirtin/vgit.nvim',
    config = function() require('configs.vgit') end
  }

  ---REPL---
  use 'jpalardy/vim-slime'

  ---Statusline---
  use { 'nvim-lualine/lualine.nvim',
    config = function() require('configs.lualine') end
  }
  use { 'akinsho/bufferline.nvim',
    config = function() require('configs.bufferline') end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  ---Text Objects---
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function() require('configs.indentblankline') end
  }

  ---Treesitter---
  use { 'nvim-treesitter/nvim-treesitter',
    config = function() require('configs.treesitter') end,
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { 'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle'
  }
end)
