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
end

-- PACKER:
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- THEMES:
	use {'navarasu/onedark.nvim', as = 'onedark'}
	use 'morhetz/gruvbox'
	use 'drewtempelmeyer/palenight.vim'
  use { 'folke/tokyonight.nvim', branch =  'main' }
  use {'catppuccin/nvim', as = 'catppuccin'}
	use 'marko-cerovac/material.nvim'

	-- PLUGINS:
  use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'christoomey/vim-tmux-navigator' -- Navigate with C-h C-l C-j C-k
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use	'editorconfig/editorconfig-vim'
  use 'mhinz/vim-signify'
	use {'prettier/vim-prettier',	run = 'yarn install --frozen-lockfile --production'}
	use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-commentary'
  use 'preservim/nerdcommenter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', },
    tag = 'nightly'
  }
	use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup { filetype_exclude = { "dashboard" } }
    end
  }
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
  -- Copilot:
  use "github/copilot.vim"
  -- CMP:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

	-- SYNTAX:
	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
	use 'peitalin/vim-jsx-typescript'
	use 'pangloss/vim-javascript'
	use 'mxw/vim-jsx'
	use 'leafgarland/typescript-vim'
	use 'leafOfTree/vim-svelte-plugin'
end)

