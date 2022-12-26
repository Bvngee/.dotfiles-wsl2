local color_palette = require('user.colorscheme').palette

require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    sync_install = false,
    auto_install = false,
    ignore_install = { '' },
    highlight = {
        enable = true,
        disable = { 'markdown' },
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {color_palette.fg0, color_palette.red}, -- table of hex strings
        -- termcolors = {"fg0", "fg1"} -- table of colour name strings
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['at'] = '@class.outer',
                ['it'] = '@class.inner',
                ['ac'] = '@call.outer',
                ['ic'] = '@call.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                -- ['ai'] = '@conditional.outer',
                -- ['ii'] = '@conditional.inner',
                ['a/'] = '@comment.outer',
                ['i/'] = '@comment.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
                ['as'] = '@statement.outer',
                -- ['is'] = '@scopename.inner',     --maybe uncomment the rest of them
                -- ['aA'] = '@attribute.outer',     --if it becomes less overwhelming
                -- ['iA'] = '@attribute.inner',
                -- ['aF'] = '@frame.outer',
                -- ['iF'] = '@frame.inner',
            },
        },
        -- swap = {
        --     enable = true,
        --     swap_next = {
        --         ['<leader>.'] = '@parameter.inner',
        --     },
        --     swap_previous = {
        --         ['<leader>,'] = '@parameter.inner',
        --     },
        -- },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}
