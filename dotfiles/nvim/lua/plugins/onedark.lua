-- onedark colorscheme
return {
	{
		"navarasu/onedark.nvim",
		events = "VeryLazy",
		opts = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
				lualine = {
					transparent = true,
				},
			})
			return require("onedark").load()
		end,
	},
}
