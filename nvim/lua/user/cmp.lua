-- ################################################################################################
-- ################################################################################################
-- ##                                             CMP Setup                                      ##
-- ################################################################################################
-- ################################################################################################

local cmp = require 'cmp'
local kind_icons = {
	Text = '  ',
	Method = '  ',
	Function = '  ',
	Constructor = '  ',
	Field = '  ',
	Variable = '  ',
	Class = '  ',
	Interface = '  ',
	Module = '  ',
	Property = '  ',
	Unit = '  ',
	Value = '  ',
	Enum = '  ',
	Keyword = '  ',
	Snippet = '  ',
	Color = '  ',
	File = '  ',
	Reference = '  ',
	Folder = '  ',
	EnumMember = '  ',
	Constant = '  ',
	Struct = '  ',
	Event = '  ',
	Operator = '  ',
	TypeParameter = '  ',
}

cmp.setup {
	snippet = {
		expand = function(args)
			require 'snippy'.expand_snippet(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert {
		['<C-Up>'] = cmp.mapping.scroll_docs(-4),
		['<C-Down>'] = cmp.mapping.scroll_docs(4),
		['<Tab>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'snippy' },
		{ name = 'npm' },
	},
	formatting = {
		fields = { 'abbr', 'kind' },
		format = function(_ , vim_item)
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			return vim_item
		end
	},
}

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
