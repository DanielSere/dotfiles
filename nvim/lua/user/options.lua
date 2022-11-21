-- ################################################################################################
-- ################################################################################################
-- ##                                      Setting Options                                       ##
-- ################################################################################################
-- ################################################################################################
local set = vim.opt
set.hlsearch = false
set.number = true
set.mouse = 'a'
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.timeoutlen = 500
set.signcolumn = 'number'
set.completeopt = 'menuone,noselect'
set.termguicolors = true
set.numberwidth = 1
set.wrap = true
set.clipboard = "unnamed,unnamedplus"
set.swapfile = false
set.cursorline = true
set.cursorcolumn = true
set.tabstop = 2
set.shiftwidth = 2
set.syntax = "enable"
-- vim.cmd([[set list listchars=tab:\▎\ ]])
set.background = 'dark'
-- vim.cmd('colorscheme PaperColor')

require('onedark').setup { style = 'deep' } --  dark, darker, cool, deep, warm, warmer, light
require('onedark').load()
