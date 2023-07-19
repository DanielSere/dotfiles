-- ################################################################################################
-- ################################################################################################
-- ##                                      Packer Setup                                          ##
-- ################################################################################################
-- ################################################################################################
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd.packadd('packer.nvim')
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
	use 'navarasu/onedark.nvim'
	use 'mhartington/oceanic-next'
	use 'morhetz/gruvbox'
	use 'ray-x/aurora'
	use 'embark-theme/vim'
	use 'wdhg/dragon-energy'
	use 'kadekillary/skull-vim'
	use 'rebelot/kanagawa.nvim'
	use 'sainnhe/everforest'
	-- completion plugins
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'dcampos/nvim-snippy'
	use 'dcampos/cmp-snippy'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'David-Kunz/cmp-npm'
	-- telescope plugins
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
	use 'nvim-telescope/telescope-file-browser.nvim'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- show colors
	use 'norcalli/nvim-colorizer.lua'
	-- other plugins
	use 'nvim-lualine/lualine.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'folke/which-key.nvim'
	use 'numToStr/Comment.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'kovetskiy/sxhkd-vim'
	use {"akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }
	use {"windwp/nvim-autopairs",   config = function() require("nvim-autopairs").setup {} end }
end)
