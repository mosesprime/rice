-- onedark colorscheme
return {
	{
		"navarasu/onedark.nvim",
		opts = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
				lualine = {
					transparent = true,
				},
			})
			require("onedark").load()
		end,
	},
}
