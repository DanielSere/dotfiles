-- ################################################################################################
-- ################################################################################################
-- ##                                      Setting Options                                       ##
-- ################################################################################################
-- ################################################################################################
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 500
vim.opt.signcolumn = 'number'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true
vim.opt.numberwidth = 2
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.guicursor = "a:hor100"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.scrolloff = 10

-- [[ Theme ]] --
vim.opt.background = 'dark'
vim.g.onedark_config = { style = 'deep' }
vim.cmd('colorscheme xresources')
