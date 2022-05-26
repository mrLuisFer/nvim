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
  use {
    'folke/tokyonight.nvim',
    branch =  'main'
  }

  -- PLUGINS:
  use 'kyazdani42/nvim-web-devicons' 
	use 'kyazdani42/nvim-tree.lua'
	use 'ryanoasis/vim-devicons'
	-- Navigate with C-h C-l C-j C-k
	use 'christoomey/vim-tmux-navigator'
	-- FZF
	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use 'junegunn/fzf.vim'
  use 'glepnir/dashboard-nvim'
	-- Git Integration
	use 'tpope/vim-fugitive'
	use 'neovim/nvim-lspconfig'
  -- CoC Config
  use {'neoclide/coc.nvim', branch = 'release'}

		-- IDE
	use	'editorconfig/editorconfig-vim'
  use 'mhinz/vim-signify'
	use {
		'prettier/vim-prettier',
		run = 'yarn install --frozen-lockfile --production',
		branch = 'release/0.x'
	}
	use {	'fatih/vim-go', run = ':GoUpdateBinaries' }
	use 'romgrk/barbar.nvim'
	use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
	use { 'glepnir/galaxyline.nvim', branch = 'main' }
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-commentary'
  use 'preservim/nerdcommenter'
  use 'jiangmiao/auto-pairs'

	-- JSX PLUGINS
	use 'pangloss/vim-javascript'
	use 'mxw/vim-jsx'
	use 'leafgarland/typescript-vim'
	use 'peitalin/vim-jsx-typescript'
  use 'Yggdroot/indentLine'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  }
end)

