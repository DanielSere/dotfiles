-- ################################################################################################
-- ################################################################################################
-- ##                                      Packer Setup                                          ##
-- ################################################################################################
-- ################################################################################################
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- package manager
	use 'wbthomason/packer.nvim'
	-- git plugins
	use 'lewis6991/gitsigns.nvim'
	-- treesitter plugins
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	-- lsp plugins
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	-- themes
	use 'navarasu/onedark.nvim' -- onedark
	-- use 'tomasiser/vim-code-dark'-- codedark
	-- use 'sainnhe/everforest'-- everforest
	-- use 'ray-x/aurora' -- aurora
	-- completion plugins
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'
	-- telescope plugins
	use 'nvim-telescope/telescope-file-browser.nvim'
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- other plugins
	use 'nvim-lualine/lualine.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'folke/which-key.nvim'
	use 'numToStr/Comment.nvim'
	use 'nvim-lua/plenary.nvim'
end)
