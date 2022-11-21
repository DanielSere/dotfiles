-- ################################################################################################
-- ################################################################################################
-- ##                                          WhichKey                                          ##
-- ################################################################################################
-- ################################################################################################
local which_key = require('which-key')
which_key.setup {
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	key_labels = {
		['<leader>'] = '<space>',
		['<esc>'] = '<escape>',
		['<cr>'] = '<enter>',
		['<bs>'] = '<backspace>'
	},
}
local mappings = {
	c = { name = 'Comment' },
	f = { name = 'File' },
	l = { name = 'LSP' },
	p = { name = 'Packer' },
	s = { name = 'Search' },
	t = { name = 'Terminal' },
}
local opts = {
	mode = 'n',
	prefix = '<leader>',
}
which_key.register(mappings, opts)
