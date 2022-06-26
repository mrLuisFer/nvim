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

  -- PLUGINS:
  use 'kyazdani42/nvim-web-devicons' 
	use 'ryanoasis/vim-devicons'
  use 'adelarsq/vim-devicons-emoji' 
	-- Navigate with C-h C-l C-j C-k
	use 'christoomey/vim-tmux-navigator'
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use	'editorconfig/editorconfig-vim'
  use 'mhinz/vim-signify'
	use {
		'prettier/vim-prettier',
		run = 'yarn install --frozen-lockfile --production',
		branch = 'release/0.x'
	}
	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
	use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
	use { 'glepnir/galaxyline.nvim', branch = 'main' }
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-commentary'
  use 'preservim/nerdcommenter'
  use 'jiangmiao/auto-pairs'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', },
    tag = 'nightly' 
  }
	use 'pangloss/vim-javascript'
	use 'mxw/vim-jsx'
	use 'leafgarland/typescript-vim'
	use 'peitalin/vim-jsx-typescript'
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
  use "github/copilot.vim"
  
  -- CMP:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)

