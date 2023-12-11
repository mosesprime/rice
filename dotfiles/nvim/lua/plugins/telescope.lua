-- telescope fuzzy finding
return {
	{
		"nvim-telescope/telescope.nvim",
		-- TODO: add keymaps
		events = "VeryLazy",
		opts = {
			defaults = {
				-- TODO:
			},
		},
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extenssion("fzf")
			end,
		},
	},
}
