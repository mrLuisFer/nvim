require("lazy").setup({
	{
		'folke/neodev.nvim',
		config = function()
			require("neodev").setup()
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<C-b>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("neo-tree").setup()
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }
	},
	{
		'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup()
		end,
	},
	"wbthomason/packer.nvim",
	{ "lewis6991/impatient.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "morhetz/gruvbox" },
	{ "folke/tokyonight.nvim" },
	{ "glepnir/zephyr-nvim" },
	{ "wadackel/vim-dogrun" },
	'marko-cerovac/material.nvim',
	{
		"kyazdani42/blue-moon",
		config = function()
			vim.opt.termguicolors = true
			vim.cmd "colorscheme blue-moon"
		end
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "ryanoasis/vim-devicons" },
	{ "christoomey/vim-tmux-navigator" },
	{ "nvim-lualine/lualine.nvim",      dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ 'antoinemadec/FixCursorHold.nvim' },
	{ "nathom/filetype.nvim" },
	{ "goolord/alpha-nvim",             config = function() require("plugins.ui.alpha") end },
	{ "prettier/vim-prettier" },
	'MunifTanjim/prettier.nvim',
	{ "xiyaowong/nvim-transparent", config = function() require("plugins.ui.transparent") end },
	{ 'mg979/vim-visual-multi',     branch = 'master' },
	{ 'hrsh7th/vim-vsnip' },
	{ 'akinsho/bufferline.nvim',    dependencies = 'nvim-tree/nvim-web-devicons' },
	{
		'romgrk/barbar.nvim',
		dependencies = 'nvim-web-devicons',
		config = function()
			require(
				"plugins.ui.barbar")
		end
	},
	{ 'srcery-colors/srcery-vim',        as = 'srcery' },
	'numToStr/Comment.nvim',
	'tpope/vim-sleuth',
	'andweeb/presence.nvim',
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',  -- for git status
			'nvim-tree/nvim-web-devicons', -- for file icons
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'j-hui/fidget.nvim', -- Useful status updates for LSP
			'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing
		}
	},
	{ "glepnir/lspsaga.nvim" },
	{ "onsails/lspkind-nvim" },
	{ "williamboman/nvim-lsp-installer" },
	{ 'jose-elias-alvarez/null-ls.nvim', config = function() require("plugins.lsp.null-ls") end },
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'yioneko/nvim-vtsls',
	'stevearc/aerial.nvim',
	'nvim-treesitter/nvim-treesitter',
	{ 'NvChad/nvim-colorizer.lua', config = function() require("plugins.syntax.colorizer") end },
	{
		'L3MON4D3/LuaSnip',
		requires = { 'rafamadriz/friendly-snippets' },
		config = function()
			require("plugins.luasnip")
		end
	},
	{ "mcauley-penney/tidy.nvim",  config = function() require("tidy").setup() end },
	{ "preservim/nerdcommenter" },
	{ 'nacro90/numb.nvim',         config = function() require('numb') end },
	'sheerun/vim-polyglot',
	"windwp/nvim-autopairs",
	'm4xshen/autoclose.nvim',
	'github/copilot.vim', -- copilot
	'prisma/vim-prisma',
	{ "windwp/nvim-ts-autotag",                    after = "nvim-treesitter" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{ 'cljoly/telescope-repo.nvim' },
	{ 'kevinhwang91/nvim-bqf',                     ft = 'qf' },
	{ 'nvim-pack/nvim-spectre' },
	{
		"junegunn/fzf",
		dir = "~/.fzf",
	},
	{ "junegunn/fzf.vim" },
	{ 'kdheepak/lazygit.nvim' },
	{ "lewis6991/gitsigns.nvim", config = function() require("plugins.git.signs") end },
	{
		'nvim-telescope/telescope-media-files.nvim',
		config = function() require('telescope').load_extension('media_files') end
	},
	{ 'edluffy/hologram.nvim' },
	{
		'neoclide/coc.nvim',
		branch = 'release',
		config = function()
			require('plugins.syntax.coc-extensions')
		end
	}
}
)
