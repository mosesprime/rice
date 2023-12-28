-- rust crates versioning and features
return {
	{
		"saecki/crates.nvim",
		tag = "stable",
        event = { "BufRead Cargo.toml", "VeryLazy" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
		opts = {
			--
		},
	},
}
