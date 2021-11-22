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
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
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
	
	if fn.has('linux') > 0 or fn.has('unix') > 0 then
		-- Treesitter just for linux
		-- On Windows, for some reason, it doesn't work properly.
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	end
end)
