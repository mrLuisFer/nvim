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
return require("packer").startup({function()
	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim" })

	-- THEMES:
	use({ "navarasu/onedark.nvim", as = "onedark" })
	use({ "morhetz/gruvbox" })
	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "overcache/NeoSolarized", as = "neosolarized" })
	use({ "glepnir/zephyr-nvim" })
	use({ "mangeshrex/everblush.vim" })
  use({ "wadackel/vim-dogrun" })
  use 'Mofiqul/vscode.nvim'

	-- PLUGINS:
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "ryanoasis/vim-devicons" })
	use({ "christoomey/vim-tmux-navigator" }) -- Navigate with C-h C-l C-j C-k
	use({ "psliwka/vim-smoothie" })
  use({ "akinsho/bufferline.nvim", tag = "v2.*", config = function () require("bufferline").setup {} end })
	use({ "romgrk/barbar.nvim", config = function() require("plugins.ui.barbar") end })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }})
  use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
	use({ "nathom/filetype.nvim" })
	use({ "goolord/alpha-nvim", config = function() require("plugins.ui.alpha")	end })
	use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
	use({ "kyazdani42/nvim-tree.lua", config = function() require("plugins.ui.treelua") end })
  use({ "xiyaowong/nvim-transparent", config = function () require("plugins.ui.transparent") end })

  -- DOC: vim-visual-multi
  use({ 'mg979/vim-visual-multi', branch = 'master' })
    -- select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
    -- create cursors vertically with Ctrl-Down/Ctrl-Up
    -- select one character at a time with Shift-Arrows
    -- press n/N to get next/previous occurrence
    -- press [/] to select next/previous cursor
    -- press q to skip current and get next occurrence
    -- press Q to remove current cursor/selection
    -- start insert mode with i,a,I,A

  -- LSP:
	use({ "neovim/nvim-lspconfig" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "williamboman/nvim-lsp-installer" })
  use { 'folke/lsp-trouble.nvim', config = function() require("plugins.lsp.trouble") end }

  -- SYNTAX: and LANGUAGES:
	use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
  use { 'NvChad/nvim-colorizer.lua', config = function() require("plugins.syntax.colorizer") end}
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, config = function() require("plugins.luasnip") end}
  use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end })
	use({ "preservim/nerdcommenter" })
  use { "windwp/nvim-autopairs", after = { 'nvim-treesitter' }, config = function() require("plugins.syntax.autopairs") end }
  use { 'nacro90/numb.nvim', config = function() require('numb') end }

  -- TELESCOPE:
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-lua/popup.nvim" })
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'nvim-pack/nvim-spectre' }
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	use({ "junegunn/fzf.vim" })

	-- TREESITTER:
	use({ "nvim-treesitter/nvim-treesitter", config = function() require("plugins.syntax.treesitter") end })
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
	use({ "m-demare/hlargs.nvim", config = function() require("hlargs").enable() end })

  -- CMP Intellisense
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}

  -- GIT:
  use { 'kdheepak/lazygit.nvim' }
	use({ "lewis6991/gitsigns.nvim", config = function() require("plugins.git.signs") end })
  use {"sindrets/diffview.nvim", config = function() require("plugins.git.diffview") end }
	-- use { 'github/copilot.vim' } -- if you want to use GitHub Copilot, enable this plugin and run :Copilot setup

  if packer_bootstrap then
    require('packer').sync()
  end
	end
})
