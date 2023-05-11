local packerOk, packer = pcall(require, "packer")
if (not packerOk) then
  print("Packer is not installed")
  return
end
vim.cmd [[ packadd packer.nvim ]]

local use = require("packer").use
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print(packer_bootstrap)
end

-- PACKER:
packer.startup({ function()
  use("wbthomason/packer.nvim")
  use({ "lewis6991/impatient.nvim" })

  -- THEMES:
  use({ "navarasu/onedark.nvim", as = "onedark" })
  use({ "morhetz/gruvbox" })
  use({ "folke/tokyonight.nvim", branch = "main" })
  use({ "glepnir/zephyr-nvim" })
  use({ "wadackel/vim-dogrun" })
  use 'marko-cerovac/material.nvim'
	use { "kyazdani42/blue-moon", config = function()
			vim.opt.termguicolors = true
			vim.cmd "colorscheme blue-moon"
		end
	}

  -- PLUGINS:
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "ryanoasis/vim-devicons" })
  use({ "christoomey/vim-tmux-navigator" }) -- Navigate with C-h C-l C-j C-k
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use({ "nathom/filetype.nvim" })
  use({ "goolord/alpha-nvim", config = function() require("plugins.ui.alpha") end })
  use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use({ "xiyaowong/nvim-transparent", config = function() require("plugins.ui.transparent") end })
  use({ 'mg979/vim-visual-multi', branch = 'master' })
  use { 'hrsh7th/vim-vsnip' }
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons', config = function() require("plugins.ui.barbar") end }
  use {'srcery-colors/srcery-vim', as = 'srcery'}
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
	use 'andweeb/presence.nvim'
	use {'romgrk/barbar.nvim', requires = {
		'lewis6991/gitsigns.nvim', -- for git status
		'nvim-tree/nvim-web-devicons', -- for file icons
	}}
	use 'nvim-tree/nvim-tree.lua'

  -- LSP:
  use({ "neovim/nvim-lspconfig", requires = {
		-- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
		'j-hui/fidget.nvim', -- Useful status updates for LSP
    'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing
	}})
  use({ "glepnir/lspsaga.nvim" })
  use({ "onsails/lspkind-nvim" })
  use({ "williamboman/nvim-lsp-installer" })
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require("plugins.lsp.null-ls") end }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
	use 'yioneko/nvim-vtsls'
  use 'stevearc/aerial.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  -- SYNTAX: and LANGUAGES:
  use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
  use { 'NvChad/nvim-colorizer.lua', config = function() require("plugins.syntax.colorizer") end }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, config = function() require("plugins.luasnip") end }
  use({ "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end })
  use({ "preservim/nerdcommenter" })
  use { 'nacro90/numb.nvim', config = function() require('numb') end }
  use 'sheerun/vim-polyglot'
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use('m4xshen/autoclose.nvim')
	use('github/copilot.vim') -- copilot
	use 'prisma/vim-prisma'
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags


  -- TELESCOPE:
  use({ "nvim-lua/popup.nvim" })
  use { "nvim-lua/plenary.nvim" }
  use({ "nvim-telescope/telescope.nvim" })
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'cljoly/telescope-repo.nvim' }
  if fn.has("linux") or fn.has("unix") then
    -- for image viewer
    use { 'nvim-telescope/telescope-media-files.nvim',
      config = function() require('telescope').load_extension('media_files') end }
    use { 'edluffy/hologram.nvim' }
  end
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'nvim-pack/nvim-spectre' }
  use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
  use({ "junegunn/fzf.vim" })

  -- GIT:
  use { 'kdheepak/lazygit.nvim' }
  use({ "lewis6991/gitsigns.nvim", config = function() require("plugins.git.signs") end })

  if packer_bootstrap then
    require('packer').sync()
  end
end
})
