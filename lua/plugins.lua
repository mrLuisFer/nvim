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
	use 'wbthomason/packer.nvim'
	-- THEMES:
	use {'navarasu/onedark.nvim', as = 'onedark'}
	use 'morhetz/gruvbox'
	use 'drewtempelmeyer/palenight.vim'
	use 'haishanh/night-owl.vim'

	-- PLUGINS:
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
	-- Nvim Dashboard
	use 'glepnir/dashboard-nvim'
	-- Git Integration
	use 'tpope/vim-fugitive'
	use 'norcalli/nvim-colorizer.lua'
	use 'neovim/nvim-lspconfig'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  
	-- CMP Plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- IDE
	use	'editorconfig/editorconfig-vim'
  use 'mhinz/vim-signify'
	use {
		'prettier/vim-prettier',
		run = 'yarn install --frozen-lockfile --production',
		branch = 'release/0.x'
	}
	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
	use 'leafOfTree/vim-svelte-plugin'
	use 'romgrk/barbar.nvim'
	use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
	use { 'glepnir/galaxyline.nvim', branch = 'main' }

	-- JSX PLUGINS
	use 'pangloss/vim-javascript'
	use 'mxw/vim-jsx'
	use 'leafgarland/typescript-vim'
	use 'peitalin/vim-jsx-typescript'
end)

