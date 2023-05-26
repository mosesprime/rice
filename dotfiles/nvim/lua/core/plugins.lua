local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = {{ 'nvim-lua/plenary.nvim' }} },

    -- colorschemes
    'navarasu/onedark.nvim',
    -- 'folke/tokyonight.nvim',
    -- 'dracula/vim',

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    --'hrsh7th/cmp-vsnip',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
}

local opts = {}

require('lazy').setup(plugins, opts)


