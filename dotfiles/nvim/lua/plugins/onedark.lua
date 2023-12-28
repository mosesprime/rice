-- onedark colorscheme
return {
	{
		"navarasu/onedark.nvim",
        enabled = true,
		config = function()
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
