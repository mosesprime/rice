-- LSP management
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = {},
				--gopls = {},
				clangd = {},
				lua_ls = {},
			},
		},
		dependencies = {},
	},
}
-- TODO: add keymap
