local utils = require('user.plugconf.lsp.utils')
local lspconfig = require('lspconfig')


local servers = { "clangd", "sumneko_lua" }

for _, lsp in ipairs(servers) do

    -- default lsp settings
    local settings = {
        on_attach = utils.common_on_attach,
        capabilities = utils.capabilities,
    }

    -- look for lsp settings, if they exist use them (lua file name must match exactly)
    local server_settings_status_ok, server_settings = xpcall(require, function(err) end, 'user.plugconf.lsp.serverconf.' .. lsp)
    if server_settings_status_ok then
        settings = vim.tbl_deep_extend('force', settings, server_settings)
    end

    --setup lsp
    lspconfig[lsp].setup(settings)
end

local signs = {
  Error = ' ',
  Warn = ' ', --
  Info = ' ', --כֿ
  Hint = ' ', --
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
