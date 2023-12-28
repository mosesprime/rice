local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("config.options")
require("config.keymaps")
require("lazy").setup("plugins")

	--"hrsh7th/nvim-cmp",
	--"hrsh7th/cmp-nvim-lsp",
	--'hrsh7th/cmp-vsnip',
	-- 'hrsh7th/cmp-buffer',
	-- 'hrsh7th/cmp-path',
	--{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
	--"saadparwaiz1/cmp_luasnip",
	--"rafamadriz/friendly-snippets",
