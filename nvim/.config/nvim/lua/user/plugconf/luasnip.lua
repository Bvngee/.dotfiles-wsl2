--remove all snippets in global.json fron friendly-snippets
os.remove(vim.fn.stdpath('data') .. '/site/pack/packer/start/friendly-snippets/snippets/global.json')

require('luasnip.loaders.from_vscode').lazy_load()
