require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    autochdir = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    shell = 'zsh',
    auto_scroll = true,
}
