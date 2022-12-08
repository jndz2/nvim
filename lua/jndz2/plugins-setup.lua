local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads nvim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

-- plugins
return require("packer").startup(function(use)
    -- packer.nvim itsel
    use("wbthomason/packer.nvim")

    -- collection of lua scripts
    use("nvim-lua/plenary.nvim")

    -- colorscheme
    use("folke/tokyonight.nvim")

    -- tmux and navigation
    use("christoomey/vim-tmux-navigator") -- move between windows Crtl-k (up), Crtl-j (down), Crtl-h (left), Crtl-l (right)
    use("szw/vim-maximizer")

    -- essential
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- webdev icons
    use("kyazdani42/nvim-web-devicons")

    -- status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- fuzzy finder
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-nvim-lua") -- complete neovim's Lua runtime API such vim.lsp.*
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- display function signatures with current parameter emphasized

    -- snippets
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
    use("onsails/lspkind.nvim") --

    -- using packer.nvim
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

    -- manage & install lsp servers
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- config lsp servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- formating and linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- syntax highliting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    -- auto closing
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- gitsigns
    use("lewis6991/gitsigns.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
