-- Boostrap Packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Load Plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim'}
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-lua/popup.nvim'
    use 'famiu/bufdelete.nvim'
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use 'sainnhe/gruvbox-material'
    use {'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'kevinhwang91/rnvimr'
    use {'akinsho/toggleterm.nvim', tag = '*'}
    use {'lewis6991/gitsigns.nvim', tag = 'release'}
    use 'numToStr/Comment.nvim'
    use 'RRethy/vim-illuminate'
    use 'lukas-reineke/indent-blankline.nvim'
	use 'windwp/nvim-autopairs'
    use 'j-hui/fidget.nvim'
    use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' }
    use 'karb94/neoscroll.nvim'
    use 'rcarriga/nvim-notify'

    use {'L3MON4D3/LuaSnip', tag = "v1.*"}
    use 'rafamadriz/friendly-snippets'

    use 'onsails/lspkind.nvim'
    use 'folke/lsp-colors.nvim'
    use 'lvimuser/lsp-inlayhints.nvim'
    use {'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'folke/neodev.nvim'

    use 'hrsh7th/nvim-cmp'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
