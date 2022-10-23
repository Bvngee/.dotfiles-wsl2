local cmp = require('cmp')

cmp.setup{
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert(
        require('user.keybindings').cmp_mappings
    ),
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol',
        maxwidth = 50,
        before = function(entry, vim_item)
            local source_names = {
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                -- emoji = "[Emoji]",
                path = "[Path]",
                -- calc = "[Calc]",
                -- cmp_tabnine = "[Tabnine]",
                -- vsnip = "[Snippet]",
                luasnip = "[Snip]",
                buffer = "[Buf]",
            }
            vim_item.menu = source_names[entry.source.name]
            return vim_item
        end
      })
    },
    sources = {
        { name = "nvim_lsp", --[[ keyword_length = 3  ]]},
        { name = "nvim_lua", --[[ keyword_length = 3  ]]},
        { name = "buffer", --[[ keyword_length = 3  ]]},
        { name = "luasnip" },
        { name = "treesitter" },
        { name = "path" },
    },
}
