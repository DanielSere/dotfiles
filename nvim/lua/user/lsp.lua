local map = vim.keymap.set
local tb = require('telescope.builtin')
local vlb = vim.lsp.buf
-- ################################################################################################
-- ################################################################################################
-- ##                                         Mason Setup                                        ##
-- ################################################################################################
-- ################################################################################################
local servers = { 'pylsp' }

require('mason').setup()
require('mason-lspconfig').setup { ensure_installed = servers }

-- ################################################################################################
-- ################################################################################################
-- ##                                          LSP Setup                                         ##
-- ################################################################################################
-- ################################################################################################
local on_attach = function(_, bufnr)
	map('n', '<leader>lt', tb.lsp_type_definitions, { buffer = bufnr, desc = 'Type Definition' })
	map('n', '<leader>lr', tb.lsp_references, { buffer = bufnr, desc = 'Goto Reference' })
	map('n', '<leader>ld', vlb.declaration, { buffer = bufnr, desc = 'Goto Declaration' })
	map('n', '<leader>lh', vlb.hover, { buffer = bufnr, desc = 'Hover Documentation' })
	map('n', '<leader>ls', vlb.signature_help, { buffer = bufnr, desc = 'Signature Documentation' })
	map('n', '<leader>lf', vlb.formatting, { buffer = bufnr, desc = 'Format Buffer' })
end

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- ################################################################################################
-- ################################################################################################
-- ##                                       Servers Setup                                        ##
-- ################################################################################################
-- ################################################################################################
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			format = {
				enable = true,
    		defaultConfig = {
      		indent_style = 'tab',
					tab_width = 2,
				},
			},
			runtime = {
				version = 'Lua 5.4',
				path = runtime_path,
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = { library = vim.api.nvim_get_runtime_file('', true) },
			telemetry = { enable = false, },
		},
	},
}
require('lspconfig').pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
}
require('lspconfig').gopls.setup {}
require('lspconfig').html.setup {}
require('lspconfig').cssls.setup {}
require('lspconfig').tsserver.setup {}
require('lspconfig').marksman.setup {}
require('lspconfig').bashls.setup {}
