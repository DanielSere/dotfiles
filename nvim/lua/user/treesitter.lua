-- ################################################################################################
-- ################################################################################################
-- ##                                    Treesitter Setup                                        ##
-- ################################################################################################
-- ################################################################################################
require('nvim-treesitter.configs').setup {
	ensure_installed = { 'lua', 'python', 'typescript', 'javascript', 'html', 'css' },
	auto_install = true,
	highlight = { enable = true },
	-- indent = { enable = true },
}
