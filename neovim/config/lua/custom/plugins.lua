-- install packer.nvim if needed
local install_path = vim.fn.stdpath 'data' .. "/site/pack/packer/opt/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.api.nvim_echo({{ "Installing Packer.nvim", "Type" }}, true, {})
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function (use)
	use 'wbthomason/packer.nvim' 

	use { 'neovim/nvim-lspconfig',
		requires = {
            { 'williamboman/mason.nvim', 
                run = ':MasonUpdate'
            },
			'williamboman/mason-lspconfig.nvim',
		},
	}

	use { 'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}

	use { 'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	use { 'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}

	use { 'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	use { 'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	}

    -- colorschemes
	use 'navarasu/onedark.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'tanvirtin/monokai.nvim'

	if is_bootstrap then
		require('packer').sync()
	end
end)
	
