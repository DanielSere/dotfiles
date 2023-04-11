-- ################################################################################################
-- ################################################################################################
-- ##                                             CMP Setup                                      ##
-- ################################################################################################
-- ################################################################################################
local cmp = require 'cmp'
local kind_icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = ' ',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
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
		{ name = 'snippy' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'npm' },
	},
	formatting = {
		fields = { 'abbr', 'kind' , 'menu'},
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = "(" .. entry.source.name .. ")"
			if entry.source.name == "nvim_lsp" then
				vim_item.dup = 0
			end
			return vim_item
		end
	},
}

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {{ name = 'buffer' },}
})

