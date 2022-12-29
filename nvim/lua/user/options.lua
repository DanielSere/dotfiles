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
set.guicursor = "a:hor100-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
set.tabstop = 2
set.shiftwidth = 2
set.syntax = "enable"
set.scrolloff = 15
-- vim.cmd([[set list listchars=tab:\▎\ ]])
set.background = 'dark'
-- vim.cmd('colorscheme PaperColor')

require('onedark').setup { style = 'deep' } --  dark, darker, cool, deep, warm, warmer, light
require('onedark').load()
