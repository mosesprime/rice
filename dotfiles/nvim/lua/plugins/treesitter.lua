-- treesitter highlighting
return {
	{
		"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
                "cpp",
				"lua",
				"vim",
				"rust",
                "ron",
                "toml",
				"go",
				"zig",
				"odin",
				"nasm",
				"html",
				"bash",
                "json",
                "regex",
                "markdown",
                "markdown_inline",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				-- enable by default
				enable = true,
				-- disable if file is over 100KB
				disable = function(_, buf)
					local max_file_size = 100 * 1024
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats.size > max_file_size then
						return true
					end
				end,
			},
            indent = {
                enable = true,
            },
		},
	},
}
