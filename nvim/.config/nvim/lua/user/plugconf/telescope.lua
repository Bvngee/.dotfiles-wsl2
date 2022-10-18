local utils = require('user.utils')
utils.dump { 1, 2, 3 }
utils.dump(require('user.keybindings').telescope_mappings)

require('telescope').setup {
    defaults = {
        path_display = { 'smart' },
        mappings = require('user.keybindings').telescope_mappings,
        pickers = {
            find_files = {
                theme = 'dropdown',
                previewer = false,
            },
            buffers = {
                theme = 'dropdown',
                previewer = false,
                initial_mode = 'normal',
            },
        },
    },
}
