-- ensure install of lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to git lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- load options
require("config.options")

-- load keymaps
require("config.keymaps")

-- init lazy plugin manager <https://lazy.folke.io/>
require("lazy").setup({
	spec = {
		{ import = "plugins" }, -- import my plugins
	},
	defaults = {
		lazy = false, -- enable default use of lazy loading for plugins
		version = false, -- use latest commit, recommended false, "*" to try latest stable version via semver
	},
	checker = {
		enabled = true, -- auto check for plugin updates
		notify = true, -- notify when updates are available
	},
})
