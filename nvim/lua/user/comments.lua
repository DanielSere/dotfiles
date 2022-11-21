-- ################################################################################################
-- ################################################################################################
-- ##                                     Comment Setup                                          ##
-- ################################################################################################
-- ################################################################################################
require('Comment').setup {
	padding = true,
	sticky = true,
	toggler = {
		line = '<leader>cl',
		block = '<leader>cb',
	},
	extra = {
		eol = '<leader>ce',
	},
}
