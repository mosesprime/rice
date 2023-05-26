local lspconfig = require('lspconfig')

local on_attach = function(_,_)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

