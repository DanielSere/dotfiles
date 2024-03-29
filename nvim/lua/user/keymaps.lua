-- ################################################################################################
-- ################################################################################################
-- ##                                       Keymaps Setup                                        ##
-- ################################################################################################
-- ################################################################################################
local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<leader>w',  ':w<cr>',    { desc = 'Write' })
map('n', '<leader>q',  ':q<cr>',    { desc = 'Quit' })
map('n', '<C-w>',      ':w!<cr>',   { desc = 'Force Write' })
map('n', '<C-q>',      ':q!<cr>',   { desc = 'Force Quit' })
map('n', '<C-z>',      ':wq<cr>',   { desc = 'Write and Quit' })
map('n', '<leader>fn', ':enew<cr>', { desc = 'New File' })

map('n', '<leader>tt', ':TermExec direction=float dir=pwd cmd=clear;pfetch <cr>', { desc = 'terminal' })
map('n', '<leader>tl', ':TermExec direction=float dir=pwd cmd=lazygit;exit <cr>', {desc = 'lazygit'})
map('n', '<leader>tf', ':TermExec direction=float dir=pwd cmd=lf;exit <cr>',      {desc = 'lf'})

map('n', '<leader>pc', ':PackerCompile <cr>', { desc = 'Packer Compile' })
map('n', '<leader>pi', ':PackerInstall <cr>', { desc = 'Packer Install' })
map('n', '<leader>ps', ':PackerSync <cr>',    { desc = 'Packer Sync' })
map('n', '<leader>pS', ':PackerStatus <cr>',  { desc = 'Packer Status'})
map('n', '<leader>pu', ':PackerUpdate <cr>',  { desc = 'Packer Update'})

map('n', 'bc', ':bd<cr>',       { desc = 'Buffer Close'})
map('n', 'ba', ':bufdo bd<cr>', { desc = 'Buffer Close All'})
map('n', 'bn', ':bn<cr>',       { desc = 'Buffer Next'})
map('n', 'bb', ':bp<cr>',       { desc = 'Buffer Previous'})

local tb  = require('telescope.builtin')
local tef = require('telescope').extensions.file_browser

map('n', '<leader>sc', tb.current_buffer_fuzzy_find, { desc = 'Fuzzily search in current buffer]' })
map('n', '<leader>sb', tb.buffers,                   { desc = 'Find existing buffers' })
map('n', '<leader>sf', tb.find_files,                { desc = 'Search Files' })
map('n', '<leader>sh', tb.help_tags,                 { desc = 'Search Help' })
map('n', '<leader>sw', tb.grep_string,               { desc = 'Search current Word' })
map('n', '<leader>sg', tb.live_grep,                 { desc = 'Search by Grep' })
map('n', '<leader>st', tb.builtin,                   { desc = 'Telescope Main Menu' })
map('n', '<leader>d',  tb.diagnostics,               { desc = 'Diagnostics' })
map('n', '<leader>e',  tef.file_browser,             { desc = 'Explorer' })

map('n', '<leader>m', ':Mason<cr>', {desc = 'Mason'})

map('n', '<leader>b', ':Telescope buffers<cr>', {desc = 'Buffers'})

map('n', '/c', ':nohlsearch<cr>', {desc = 'Clear search highlight'})
map('n', '//', '/', {desc = 'Search pattern'})
