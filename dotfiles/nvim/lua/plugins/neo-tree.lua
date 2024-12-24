-- file explorer
return {
	-- <https://github.com/nvim-neo-tree/neo-tree.nvim>
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvm-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	cmd = "NeoTree",
	keys = {
		{
			--toggle file explorer
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ source = "filesystem", toggle = true })
			end,
			desc = "Explore NeoTree",
		},
		{
			-- toggle buffer explorer
			"<leader>be",
			function ()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Explore Buffers",
		},
    },
	deactivate = function ()
		vim.cmd([[NeoTree close]])
	end,
	opts = {
		window = {
			-- keymap overwrites for while in neotree window
			mappings = {
				["l"] = "open",
				["h"] = "close_node"
			},
		},
	},
	config = function(_, opts)
		-- force load opts
		require("neo-tree").setup(opts)
	end,
}
