local plugins = {
    -- Packer can manage itself
    'wbthomason/packer.nvim',

    "williamboman/mason.nvim",

    "neovim/nvim-lspconfig",

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { "catppuccin/nvim",                 as = "catppuccin" },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = 'v2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    },
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end,
    },
    -- -- autocompletion
    "hrsh7th/nvim-cmp",   -- completion plugin
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path",   -- source for file system paths
    --
    -- -- snippets
    "L3MON4D3/LuaSnip",             -- snippet engine
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets

    -- comment
    'numToStr/Comment.nvim',

    -- DAP (Debug Adapter Protocol) setup
    {
      "mfussenegger/nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
      },
      config = function()
        require("dapui").setup()
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function()
      --   local path = "~/.virtualenvs/debugpy/bin/python" -- change this to your python path
        require('dap-python').setup("python3")
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
}

require("lazy").setup(plugins)
