-- ################################################################################################
-- ################################################################################################
-- ##                                     Lualine Setup                                          ##
-- ################################################################################################
-- ################################################################################################
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local branch = {
	"branch",
	icons_enabled = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "+", modified = "~", removed = "-" },
}

local filename = {
	"filename",
	filestatus = false,
	newfile_status = false,
	path = 3,
	symbols = {
		modified = '',
		readonly = '',
		unnamed = '',
		newfile = '',
	}
}

local progress = {
	'progress',
	padding = {right = 1},
}

local location = {
	"location",
	padding = { left = 1, right = 1},
}

local buffers = {
	'buffers',
	buffers_color = {
		active = {bg = 'lualine_b_normal', fg = '#ff9e3b'},
		inactive = 'lualine_c_normal',
	},
	mode = 0,
	symbols = {
		modified = '*',
		alternate_file = '',
		directory =  '',
	},
	filetype_names = {
		mason = 'Mason',
	},
	max_length = vim.o.columns
}

local lspclient = {
	function()
		local msg = 'none'
		local ft = vim.bo.filetype
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		local clients_output = {}
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, ft) ~= -1 then
				table.insert(clients_output, client.name)
			end
		end
		if #clients_output > 0 then
			return table.concat(clients_output, "|")
		else
			return msg
		end
	end
}

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '',
		section_separators = '',
		globalstatus = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { branch, diff, diagnostics },
		lualine_c = { filename },
		lualine_x = { 'filetype' },
		lualine_y = { lspclient },
		lualine_z = { location, progress },
	},
	tabline = {
		lualine_a = { buffers }
	},
}
