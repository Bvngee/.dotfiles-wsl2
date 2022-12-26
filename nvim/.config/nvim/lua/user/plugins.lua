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

    -- treesitter related
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'

    -- snippet
    use {'L3MON4D3/LuaSnip', tag = "v1.*"}
    use 'rafamadriz/friendly-snippets'

    -- lsp plugins
    use 'onsails/lspkind.nvim' --formatted lsp completion menu
    use 'folke/lsp-colors.nvim'
    use 'lvimuser/lsp-inlayhints.nvim'
    use {'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'ray-x/lsp_signature.nvim'
    use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'} --prettier lsp-related lists
     
    -- mason / lsp config
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'folke/neodev.nvim'
    use 'hrsh7th/nvim-cmp'

    -- other
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim'}
    use 'nvim-lua/popup.nvim' --popup window api
    use 'famiu/bufdelete.nvim' --safely and cleanly delete buffers
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} --File explorer
    use 'simrat39/rust-tools.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'sainnhe/gruvbox-material' --colorscheme
    use {'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'kevinhwang91/rnvimr' --implement Ranger file manager
    use {'akinsho/toggleterm.nvim', tag = '*'}
    use {'lewis6991/gitsigns.nvim', tag = 'release'}
    use 'numToStr/Comment.nvim' --manage comments, language independent
    use 'RRethy/vim-illuminate' --highlight instances of word under cursor
    use {'kylechui/nvim-surround', tag = "*"}
    use 'lukas-reineke/indent-blankline.nvim'
	use 'windwp/nvim-autopairs'
    use 'NvChad/nvim-colorizer.lua'
    use 'j-hui/fidget.nvim' --lsp progress information
    use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' }
    use 'karb94/neoscroll.nvim'
    use 'rcarriga/nvim-notify'
    use {'abecodes/tabout.nvim', requires = 'nvim-treesitter/nvim-treesitter' }
    use 'nacro90/numb.nvim' --preview page when changing lines (:100)
    use 'petertriho/nvim-scrollbar'
    use 'kevinhwang91/nvim-hlslens' --virtual text for search results, allows scrollbar to show search results


    if packer_bootstrap then
        require('packer').sync()
    end
end)



-- Graveyard
--[[
use 'smjonas/snippet-converter.nvim' --one time use, + ended up using a command to fix friendly-snippets
]]

