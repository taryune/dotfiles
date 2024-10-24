return {
  -- colorscheme
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end
  },
  -- transparent
  {
    'xiyaowong/nvim-transparent',
  },
  -- lightline
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'kanagawa',
      }
    end
  },
  -- tmux
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', {})
      vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', {})
      vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', {})
      vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', {})
    end
  },
  -- hightlight yank
  {
    'machakann/vim-highlightedyank',
    config = function()
      vim.g.highlightedyank_highlight_duration = 200
    end
  },
  -- git
  'f-person/git-blame.nvim',
  'airblade/vim-gitgutter',
  -- copilot
  'github/copilot.vim',
  -- preview
  'rmagatti/goto-preview',
  'nvim-telescope/telescope.nvim',
  -- fzf
  {
    'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config/fzf')
    end
  },
  -- lsp
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v4.x',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('config/lsp')
    end
  },
  -- lsp signature
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end
  },
  -- fidget
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
  -- cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      require('config/cmp')
    end
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('config/treesitter')
    end
  },
  --fern
  {
    'lambdalisue/fern.vim',
    dependencies = {
      'lambdalisue/fern-git-status.vim',
    },
    config = function()
      require('config/fern')
    end
  },
  -- which-key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('config/which-key')
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.icons'
    }
  },
  -- commenter
  {
    'preservim/nerdcommenter',
    config = function()
      require('config/nerdcommenter')
    end
  },
  -- auto pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- AI
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require('config/codecompanion')
    end
  }
}
