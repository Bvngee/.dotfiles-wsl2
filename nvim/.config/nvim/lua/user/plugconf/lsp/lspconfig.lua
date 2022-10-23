local utils = require('user.plugconf.lsp.utils')
local lspconfig = require('lspconfig')

local servers = { 'clangd', 'sumneko_lua', 'rust_analyzer', 'bashls', 'pyright' }

for _, lsp in ipairs(servers) do
    -- default lsp settings
    local opts = {
        on_attach = utils.common_on_attach,
        capabilities = utils.capabilities,
    }

    -- look for lsp settings, if they exist use them (lua file name must match exactly)
    local lsp_settings_exists, lsp_settings = xpcall(require, function(err) end, 'user.plugconf.lsp.serverconf.' .. lsp)

    -- rust-tools modified setup
    if lsp == 'rust_analyzer' then
        require('rust-tools').setup(lsp_settings)
        goto continue
    end

    -- setup lsp - default method
    if lsp_settings_exists then
        opts = vim.tbl_deep_extend('force', opts, lsp_settings)
    end

    lspconfig[lsp].setup(opts)
    ::continue::
end

local icons = require('user.icons')
local signs = {
    Error = icons.Error .. ' ',
    Warn = icons.Warn .. ' ',
    Info = icons.Info .. ' ',
    Hint = icons.Hint .. ' ',
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
