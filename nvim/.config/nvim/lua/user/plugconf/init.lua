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
require('user.plugconf.nvim-navic')
require('user.plugconf.cmp')
require('user.plugconf.mason')
require('user.plugconf.neoscroll')

require('lsp-colors').setup{}
require('neodev').setup{}
require('mason-lspconfig').setup{}
require('luasnip.loaders.from_vscode').lazy_load()
require('fidget').setup{}

require('user.plugconf.lsp.lspconfig')
require('user.plugconf.lsp.null-ls')
require('user.plugconf.lsp.lsp-inlayhints')
