return {
    {
		"mason-org/mason.nvim",
        lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls", -- LUA
                "asm_lsp",
                --"asmfmt",
                --"ast-grep", 
                --"html-lsp", -- HTML
                --"htmx-lsp", -- HTMX
                --"json-lsp", -- JSON
                --"texlab", -- LaTeX
                "marksman", -- Markdown
                "ols", -- Odin
				"clangd", -- C/C++
				"rust_analyzer", -- Rust
                --"rustfmt", -- Rust
                "gopls", -- Go
                "zls", -- Zig
                "nil_ls", -- Nix
			},
		},
	},
}
