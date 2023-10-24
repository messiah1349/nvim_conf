-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "williamboman/mason.nvim"

    use "neovim/nvim-lspconfig"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "NLKNguyen/papercolor-theme"
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- -- autocompletion
    use("hrsh7th/nvim-cmp")   -- completion plugin
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path")   -- source for file system paths
    --
    -- -- snippets
    use("L3MON4D3/LuaSnip")             -- snippet engine
    use("saadparwaiz1/cmp_luasnip")     -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- comment
    use ('numToStr/Comment.nvim')

end)
