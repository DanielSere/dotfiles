-- ################################################################################################
-- ################################################################################################
-- ##                                     Telescope Setup                                        ##
-- ################################################################################################
-- ################################################################################################
local actions = require('telescope.actions')
require('telescope').setup {
	defaults = {
		prompt_prefix = '   ',
		selection_caret = '❯ ',
		sorting_strategy = 'ascending',
		layout_strategies = 'horizontal',
		layout_config = {
			horizontal = {
				prompt_position = 'top',
				preview_width = 0.55,
				results_width = 0.8,
			},
		},
		mappings = {
			i = {
				['<C-Up>'] = actions.preview_scrolling_up,
				['<C-Down>'] = actions.preview_scrolling_down,
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
}

require('telescope').load_extension 'file_browser'
pcall(require('telescope').load_extension, 'fzf')
