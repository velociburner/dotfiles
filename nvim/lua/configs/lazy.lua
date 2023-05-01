local function src_cfg(file)
  return function()
    require(string.format("configs.%s", file))
  end
end

return {
  ---Color scheme---
  { 'navarasu/onedark.nvim', config = src_cfg('onedark'), priority = 1000 },

  ---Making my life easier---
  'tpope/vim-surround',
  'tpope/vim-repeat',
  { 'numToStr/Comment.nvim', config = src_cfg('comment') },
  { 'windwp/nvim-autopairs', config = src_cfg('autopairs') },
  { 'ggandor/lightspeed.nvim', config = src_cfg('lightspeed') },
  'vim-scripts/ReplaceWithRegister',
  { 'preservim/nerdtree', cmd = {'NERDTree', 'NERDTreeToggle'} },

  ---LaTeX---
  { 'lervag/vimtex', ft = {'tex', 'bibtex'} },

  ---LSP---
  {
    'neovim/nvim-lspconfig', config = src_cfg('lspconfig'),
    event = { 'BufReadPre', 'BufNewFile' }
  },
  {
    'mfussenegger/nvim-dap', config = src_cfg('dap'),
    cmd = { 'DapContinue', 'DapToggleBreakpoint' },
    keys = { '<space>dc', '<space>bt' },
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python'
    }
  },

  ---Autocomplete---
  {
    'hrsh7th/nvim-cmp', config = src_cfg('cmp'),
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua'
    }
  },
  'ray-x/lsp_signature.nvim',

  ---Snippets---
  'SirVer/ultisnips',
  'honza/vim-snippets',

  ---Fuzzy finder---
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', config = src_cfg('telescope') },

  ---Git---
  { 'tanvirtin/vgit.nvim', config = src_cfg('vgit') },

  ---REPL---
  'jpalardy/vim-slime',

  ---Statusline---
  { 'nvim-lualine/lualine.nvim', config = src_cfg('lualine') },
  { 'akinsho/bufferline.nvim', config = src_cfg('bufferline'),
    dependencies = 'kyazdani42/nvim-web-devicons'
  },

  ---Text Objects---
  'michaeljsmith/vim-indent-object',
  'wellle/targets.vim',
  { 'lukas-reineke/indent-blankline.nvim', config = src_cfg('indentblankline') },

  ---Treesitter---
  { 'nvim-treesitter/nvim-treesitter', config = src_cfg('treesitter'),
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
      { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
    }
  },
  { 'ckolkey/ts-node-action', config = src_cfg('ts-node-action'),
    dependencies = { 'nvim-treesitter' },
    cmd = { 'NodeAction', 'NodeActionDebug' },
    keys = { '<leader>a' }
  },
}
