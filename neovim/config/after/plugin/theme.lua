require('onedark').setup {
    style = 'darker',
    transparent = true,
    lualine = {
        transparent = true,
    },
}
require('onedark').load()

require('nightfox').setup {
    options = {
        transparent = false,
    },
}

require('monokai').setup {
    italics = false
}

vim.cmd [[colorscheme onedark]]
