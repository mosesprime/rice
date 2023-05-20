-- personalized config

require('custom.set')
require('custom.plugins')
require('custom.remap')

if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- automatically source and re-compile packer
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
	--pattern = "*",
	callback = function(ctx)
		vim.cmd('source <afile> | silent! LspStop | silent! LspStart | PackerCompile')
		vim.cmd("PackerCompile")
		vim.api.nvim_echo({{ "PackerCompile Complete!" , "" }}, true, {})
	end,
})

--
require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf')

require('mason').setup()

local servers = {
	gopls = {},
	rust_analyzer = {},
}
