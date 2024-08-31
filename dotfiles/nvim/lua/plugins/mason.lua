return {
    {
		"williamboman/mason.nvim",
        lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig",
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
                --"marksman", -- Markdown
                --"ols", -- Odin
				"clangd", -- C/C++
				"rust_analyzer", -- Rust
                --"rustfmt", -- Rust
                "gopls", -- Go
                "zls", -- Zig
			},
		},
	},
}
