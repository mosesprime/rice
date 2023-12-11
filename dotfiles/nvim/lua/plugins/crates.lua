-- rust crates version and features
return {
	{
		"saecki/crates.nvim",
		event = "VeryLazy",
		tag = "stable",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
		opts = {
			-- TODO: add keymaps
		},
	},
}
