return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
				},
			})
		end,
	},
}
