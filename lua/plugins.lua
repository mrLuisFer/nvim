local use = require('packer').use
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  local packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	print(packer_bootstrap)
end

-- PACKER:
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- THEMES:
	use {'navarasu/onedark.nvim', as = 'onedark'}
	use 'morhetz/gruvbox'
  use { 'folke/tokyonight.nvim', branch =  'main' }
  use {'catppuccin/nvim', as = 'catppuccin'}
	use 'marko-cerovac/material.nvim'
	use {'overcache/NeoSolarized', as = 'neosolarized'}
	use 'glepnir/zephyr-nvim'
	-- PLUGINS:
  use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'christoomey/vim-tmux-navigator' -- Navigate with C-h C-l C-j C-k
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
	use 'neovim/nvim-lspconfig'
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
	use	'editorconfig/editorconfig-vim'
  use 'mhinz/vim-signify'
	use {'prettier/vim-prettier',	run = 'yarn install --frozen-lockfile --production'}
	use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-commentary'
  use 'preservim/nerdcommenter'
  use {'kyazdani42/nvim-tree.lua', tag = 'nightly'}
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
	use 'nvim-lua/popup.nvim'
	use 'windwp/nvim-ts-autotag'
  use {'norcalli/nvim-colorizer.lua', config = function () require('colorizer').setup() end}
  use {"lukas-reineke/indent-blankline.nvim", config = function() require("indent_blankline").setup { filetype_exclude = { "dashboard" } } end}
	use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use {'nvim-treesitter/nvim-treesitter'}
	use {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
	use {"mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end	}
	use {'mhartington/formatter.nvim' }
	use 'sbdchd/neoformat'
	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
	use	{'styled-components/vim-styled-components', branch = 'main' }
	use {'groenewege/vim-less', as = 'less' }
	use {'kchmck/vim-coffee-script', as = 'coffee' }
	use 'folke/lsp-colors.nvim'
	use 'xiyaowong/nvim-transparent'
	-- CMP:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- if you want to use GitHub Copilot, enable this plugin and run :Copilot setup
	-- use 'github/copilot.vim'
end)
