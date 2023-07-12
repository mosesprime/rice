require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        "clangd",
        "gopls",
        "lua_ls",
        "rust_analyzer",
    }
}

