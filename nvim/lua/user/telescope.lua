-- ################################################################################################
-- ################################################################################################
-- ##                                     Telescope Setup                                        ##
-- ################################################################################################
-- ################################################################################################
local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
	defaults = {
		sorting_strategy = 'ascending',
		layout_config = {
			horizontal = {
				prompt_position = 'top',
				preview_width = 0.55,
			},
		},
		mappings = {
			["i"] = {
				['<C-Up>'] = actions.preview_scrolling_up,
				['<C-Down>'] = actions.preview_scrolling_down,
			},
		},
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-n>"] = fb_actions.create,
					["<C-d>"] = fb_actions.remove,
					["<C-c>"] = fb_actions.copy,
					["<C-m>"] = fb_actions.move,
					["<C-r>"] = fb_actions.rename,
					["<C-s>"] = fb_actions.select_all,
					["<C-h>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
				},
				["n"] = {
					n = fb_actions.create,
					d = fb_actions.remove,
					c = fb_actions.copy,
					m = fb_actions.move,
					r = fb_actions.rename,
					s = fb_actions.select_all,
					h = fb_actions.goto_home_dir,
					w = fb_actions.goto_cwd,
				},
			},
		},
	},
}

require('telescope').load_extension 'file_browser'
require('telescope').load_extension 'fzf'
