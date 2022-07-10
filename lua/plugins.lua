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
return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim" })
	-- THEMES:
	use({ "navarasu/onedark.nvim", as = "onedark" })
	use({ "morhetz/gruvbox" })
	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "marko-cerovac/material.nvim" })
	use({ "overcache/NeoSolarized", as = "neosolarized" })
	use({ "glepnir/zephyr-nvim" })
	use({ "JoosepAlviste/palenightfall.nvim" })
	use({ "mangeshrex/everblush.vim" })
	-- PLUGINS:
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "ryanoasis/vim-devicons" })

	use({ "christoomey/vim-tmux-navigator" }) -- Navigate with C-h C-l C-j C-k

	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	use({ "junegunn/fzf.vim" })

	use({ "neovim/nvim-lspconfig" })
	use({ "tami5/lspsaga.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "williamboman/nvim-lsp-installer" })
	use({ "folke/lsp-colors.nvim" })

	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use({ "romgrk/barbar.nvim" })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	use({ "editorconfig/editorconfig-vim" })

	use({ "mhinz/vim-signify" })
	use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
	use({ "psliwka/vim-smoothie" })
	use({ "tpope/vim-commentary" })
	use({ "preservim/nerdcommenter" })
	use("jose-elias-alvarez/null-ls.nvim")

	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim" },
		},
	})
	use({ "nvim-lua/popup.nvim" })

	use({ "norcalli/nvim-colorizer.lua" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		"mcauley-penney/tidy.nvim",
		config = function()
			require("tidy").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "mhartington/formatter.nvim" })

	use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
	use({ "xiyaowong/nvim-transparent" })
	use({ "nathom/filetype.nvim" })
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({ "folke/zen-mode.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	})
	use({ "goolord/alpha-nvim" })
	use({ "rcarriga/nvim-notify" })
	-- CMP:
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-calc" })
	use({ "David-Kunz/cmp-npm" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	-- if you want to use GitHub Copilot, enable this plugin and run :Copilot setup
	-- use { 'github/copilot.vim' }
	if packer_bootstrap then
		print("Updating packer...")
		require("packer").sync()
	end
end)
