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
	map('n', '<leader>lf', vlb.format, { buffer = bufnr, desc = 'Format Buffer' })
end

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

require('lspconfig').gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = function(_, params, client_id, config)
			if params.diagnostics ~= nil then
				local idx = 1
				while idx <= #params.diagnostics do
					if params.diagnostics[idx].code == 80001 then
						table.remove(params.diagnostics, idx)
					else
						idx = idx + 1
					end
				end
			end
			vim.lsp.diagnostic.on_publish_diagnostics(_, params, client_id, config)
		end,
	},
}

require('lspconfig').marksman.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require('lspconfig').bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
