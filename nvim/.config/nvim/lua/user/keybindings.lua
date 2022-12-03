--- Mapping Functions ---
local M = {}
local opts = { noremap = true, silent = true }
local termopts = { silent = true }

local function bufmap(bufnr, mode, shortcut, command, opt)
    vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, command, opt)
end

local function map(mode, shortcut, command, opt)
    vim.keymap.set(mode, shortcut, command, opt)
end

local function nmap(shortcut, command)
    map('n', shortcut, command, opts)
end

local function imap(shortcut, command)
    map('i', shortcut, command, opts)
end

local function vmap(shortcut, command)
    map('v', shortcut, command, opts)
end

local function cmap(shortcut, command)
    map('c', shortcut, command, opts)
end

local function tmap(shortcut, command)
    map('t', shortcut, command, termopts)
end

--- General Mappings ---

-- save and close all
nmap('<S-q>', ':xa<CR>')

-- stay in visual mode when indenting
vmap('<', '<gv')
vmap('>', '>gv')

-- moving text up and down
vmap('<A-j>', ':m .+1<CR>==')
vmap('<A-k>', ':m .-2<CR>==')
-- xmap('<A-j>', ":move '>+1<CR>gv-gv")
-- xmap('<A-k>', ":move '<-2<CR>gv-gv")

-- maintain register contents after paste
vmap('p', '"_dP')

-- easier delete-without-yank keybind
nmap('_d', '"_d')

-- x key doesn't yank
nmap('x', '"_x')
vmap('x', '"_x')

-- yank to system clipboard
vmap('<leader>y', '"*y')

-- buffer navigation
nmap('<C-A-h>', '<C-w>h')
nmap('<C-A-j>', '<C-w>j')
nmap('<C-A-k>', '<C-w>k')
nmap('<C-A-l>', '<C-w>l')

--- Plugin Mappings ---

-- nvim-tree
nmap('<leader>t', ':NvimTreeToggle<CR>')
nmap('<C-s>', ':lua require("nvim-tree.api").tree.change_root_to_node()<CR>')

-- bufferline
nmap('<leader>1', ':BufferLineGoToBuffer 1<CR>')
nmap('<leader>2', ':BufferLineGoToBuffer 2<CR>')
nmap('<leader>3', ':BufferLineGoToBuffer 3<CR>')
nmap('<leader>4', ':BufferLineGoToBuffer 4<CR>')
nmap('<leader>5', ':BufferLineGoToBuffer 5<CR>')
nmap('<leader>6', ':BufferLineGoToBuffer 6<CR>')
nmap('<leader>7', ':BufferLineGoToBuffer 7<CR>')
nmap('<leader>8', ':BufferLineGoToBuffer 8<CR>')
nmap('<leader>9', ':BufferLineGoToBuffer 9<CR>')
nmap('[b', ':BufferLineCyclePrev<CR>')
nmap(']b', ':BufferLineCycleNext<CR>')
nmap('[mb', ':BufferLineMovePrev<CR>')
nmap(']mb', ':BufferLineMoveNext<CR>')
nmap('<leader>db', ':Bdelete<CR>')

-- null-ls
nmap('<leader>f', ':lua vim.lsp.buf.format()<CR>')
vmap('<leader>f', ':lua vim.lsp.buf.format()<CR>')

-- ranger (rnvimr)
nmap('<leader>r', ':RnvimrToggle<CR>')

-- Telescope
nmap('<leader>fb', ':Telescope buffers<CR>')
nmap('<leader>lg', ':Telescope live_grep<CR>')
nmap('<leader>rs', ':Telescope resume<CR>')
nmap('<leader>ff', ':Telescope find_files<CR>')

-- neoscroll
nmap('<C-y>', '<C-y>zz')
nmap('<C-e>', '<C-e>zz')

-- ToggleTerm
function M.set_terminal_keymaps()
    local term_opts = { buffer = 0 }
    map('t', '<S-ESC>', [[<C-\><C-n>]], term_opts)
    map('t', '<C-A-h>', [[<CMD>wincmd h<CR>]], term_opts)
    map('t', '<C-A-j>', [[<CMD>wincmd j<CR>]], term_opts)
    map('t', '<C-A-k>', [[<CMD>wincmd k<CR>]], term_opts)
    map('t', '<C-A-l>', [[<CMD>wincmd l<CR>]], term_opts)
end
vim.cmd('autocmd! TermOpen term://* lua require("user.keybindings").set_terminal_keymaps()')

--- LSP Mappings
function M.set_lsp_keymaps(bufnr)
    bufmap(bufnr, 'n', '<leader>l', ':echo "hi!"', opts)
    bufmap(bufnr, 'n', 'gd', ':Telescope lsp_definitions<CR>', opts)
    bufmap(bufnr, 'n', 'gD', ':Telescope lsp_declarations<CR>', opts)
    bufmap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    bufmap(bufnr, 'n', 'gi', ':Telescope lsp_implementations<CR>', opts)
    bufmap(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>', opts)
    bufmap(bufnr, 'n', 'gl', ':lua vim.diagnostic.open_float()<CR>', opts)
    bufmap(bufnr, 'n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    bufmap(bufnr, 'n', 'gA', ':lua vim.lsp.buf.code_action()<CR>', opts)
    bufmap(bufnr, 'n', 'gR', ':lua vim.lsp.buf.rename()<CR>', opts)
end

--- CMP Mappings
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')
M.cmp_mappings = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, { 'i' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, { 'i' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
        elseif luasnip.jumpable(1) then
            luasnip.jump(1)
        -- elseif luasnip.expandable() then
        --     luasnip.expand {}
        -- elseif has_words_before() then
        --     cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
}

--this breaks telescope?
--- Telescope Mappings
local actions = require('telescope.actions')
M.telescope_mappings = {
    i = {
        ['<S-q>'] = actions.close,

        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Tab>'] = actions.move_selection_next,
        ['<S-Tab>'] = actions.move_selection_previous,
        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,

        ['<C-l>'] = actions.complete_tag,
        ['<C-h>'] = actions.which_key, -- keys from pressing <C-h>
        -- ['<Esc>'] = actions.close,
    },
    n = {
        ['<Esc>'] = actions.close,
        ['<S-q>'] = actions.close,
        ['<CR>'] = actions.select_default,

        ['<C-d>'] = actions.results_scrolling_up,
        ['<C-f>'] = actions.results_scrolling_down,

        ['j'] = actions.move_selection_next,
        ['<Tab>'] = actions.move_selection_next,
        ['<S-Tab>'] = actions.move_selection_previous,
        ['k'] = actions.move_selection_previous,
        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,

        ['gg'] = actions.move_to_top,
        ['G'] = actions.move_to_bottom,

        ['?'] = actions.which_key,
        ['q'] = actions.close,
    },
}

--- Neoscroll mappings
local neoscroll_mappings = {}
-- Syntax: t[keys] = {function, {function arguments}}
neoscroll_mappings['<C-d>'] = {'scroll', {'-10', 'true', '100'}}
neoscroll_mappings['<C-f>'] = {'scroll', {'10', 'true', '100'}}
neoscroll_mappings['<C-k>'] = {'scroll', {'-4', 'false', '100'}}
neoscroll_mappings['<C-j>'] = {'scroll', {'4', 'false', '100'}}
neoscroll_mappings['<C-y>'] = {'scroll', {'vim.wo.scroll', 'true', '0', nil}}
neoscroll_mappings['<C-e>'] = {'scroll', {'-vim.wo.scroll', 'true', '0', nil}}
-- t['<C-d>'] = {'scroll', {'-vim.wo.scroll', 'false', '50'}}
-- t['<C-f>'] = {'scroll', {'vim.wo.scroll', 'false', '50'}}

-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}

-- t['<>'] = {'scroll', {'-0.10', 'true', '1'}}
-- t['<>'] = {'scroll', { '0.10', 'true', '1'}}

neoscroll_mappings['zt'] = {'zt', {'100'}}
neoscroll_mappings['zz'] = {'zz', {'100'}}
neoscroll_mappings['zb'] = {'zb', {'100'}}

M.neoscroll_mappings = neoscroll_mappings

return M
