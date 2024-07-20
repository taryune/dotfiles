return {
  -- colorscheme
  {
    'catppuccin/nvim',
    config = function()
      vim.cmd.colorscheme "catppuccin"
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
        colorscheme = 'catppuccin',
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
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('config/lsp')
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
  {
    'preservim/nerdcommenter',
    config = function()
      require('config/nerdcommenter')
    end
  },
  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require('config/chatgpt')
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  --WhichKey
  {
    "folke/which-key.nvim",
    config = function()
      require("config/which-key")
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'echasnovski/mini.icons'
    }
  },
}
