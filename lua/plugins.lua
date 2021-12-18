local use = require('packer').use
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
		'git', 
		'clone', 
		'--depth', 
		'1', 
		'https://github.com/wbthomason/packer.nvim', 
		install_path
	})
end

-- PACKER:
return require('packer').startup(function()
	-- THEMES:
	use {
  	'marko-cerovac/material.nvim',
    as='material'
  }
	-- PLUGINS:
	use 'wbthomason/packer.nvim'
	use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
	}
	use 'ryanoasis/vim-devicons'
	-- Navigate with C-h C-l C-j C-k
  use 'christoomey/vim-tmux-navigator'
	-- FZF
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
	--
	use 'yggdroot/indentline'
	-- Nvim Dashboard
	use 'glepnir/dashboard-nvim'
	-- Git Integration
	use 'tpope/vim-fugitive'
	use 'norcalli/nvim-colorizer.lua'
	use 'neovim/nvim-lspconfig'
	-- Lualine
	use {
  	'nvim-lualine/lualine.nvim',
  	requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- CMP Plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use {'navarasu/onedark.nvim', as = 'onedark'}
	-- Typing
	use 'jiangmiao/auto-pairs'
	use 'alvan/vim-closetag'
	use 'tpope/vim-surround'

	-- IDE
	use	'editorconfig/editorconfig-vim'
	use 'terryma/vim-multiple-cursors'
	use 'mhinz/vim-signify'
	use 'preservim/nerdcommenter'
	use 'psliwka/vim-smoothie'

	use {
		'prettier/vim-prettier', 
		run = 'yarn install --frozen-lockfile --production', 
		branch = 'release/0.x'
	}
	use 'sheerun/vim-polyglot'

	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
end)

