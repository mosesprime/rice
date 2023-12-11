-- mason lsp manager
return {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig",
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"rust_analyzer",
				--"gopls",
			},
		},
	},
}
