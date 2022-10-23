require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    sync_install = false,
    auto_install = false,
    ignore_install = { '' },
    highlight = {
        enable = true,
        disable = { 'markdown' },
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
