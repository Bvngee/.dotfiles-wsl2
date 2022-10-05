local M = {}

-- common on_attach() function for lsp's
M.common_on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    --setup nvim-navic to attach to lsp server
    require('nvim-navic').attach(client, bufnr)

    --keymaps
    require('user.keybindings').set_lsp_keymaps(bufnr)
end

-- commonn capabilities for lsp's
M.capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

return M
