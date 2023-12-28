-- telescope 
return {
    -- sets the vim.ui.select to telescope
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
	{
		"nvim-telescope/telescope.nvim",
		keys = {
            -- TODO: add keymap
        },
		opts = {
			defaults = {
				-- TODO: add defaults
			},
		},
		dependencies = {
            -- native C fuzzy finding algo
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extenssion("fzf")
				end,
			},
			{
				"nvim-lua/plenary.nvim",
			},
		},
	},
}
