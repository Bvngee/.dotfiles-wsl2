require('user.plugconf.telescope')
require('user.plugconf.lualine')
require('user.plugconf.bufferline')
require('user.plugconf.rnvimr')
require('user.plugconf.nvim-tree')
require('user.plugconf.toggleterm')
require('user.plugconf.gitsigns')
require('user.plugconf.Comment')
require('user.plugconf.vim-illuminate')
require('user.plugconf.indent-blankline')
require('user.plugconf.nvim-autopairs')
require('user.plugconf.nvim-colorizer')
require('user.plugconf.nvim-navic')
require('user.plugconf.cmp')
require('user.plugconf.mason')
require('user.plugconf.neoscroll')
require('user.plugconf.treesitter')
require('user.plugconf.tabout')
require('user.plugconf.luasnip')

require('lsp-colors').setup {}
require('neodev').setup {}
require('mason-lspconfig').setup {}
require('fidget').setup {}
require('nvim-surround').setup {}

require('user.plugconf.lsp.lspconfig')
require('user.plugconf.lsp.null-ls')
require('user.plugconf.lsp.lsp-inlayhints')
require('user.plugconf.lsp.lsp_signature')
