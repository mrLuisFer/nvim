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

  -- PLUGINS:
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "ryanoasis/vim-devicons" })
  use({ "christoomey/vim-tmux-navigator" }) -- Navigate with C-h C-l C-j C-k
  use({ "akinsho/bufferline.nvim", tag = "v2.*", config = function() require("bufferline").setup {} end })
  use({ "romgrk/barbar.nvim", config = function() require("plugins.ui.barbar") end })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use({ "nathom/filetype.nvim" })
  use({ "goolord/alpha-nvim", config = function() require("plugins.ui.alpha") end })
  use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
  use({ "kyazdani42/nvim-tree.lua", config = function() require("plugins.ui.treelua") end })
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use({ "xiyaowong/nvim-transparent", config = function() require("plugins.ui.transparent") end })
  use({ 'mg979/vim-visual-multi', branch = 'master' })
  use { 'hrsh7th/vim-vsnip' }

  -- LSP:
  use({ "neovim/nvim-lspconfig" })
  use({ "glepnir/lspsaga.nvim" })
  use({ "onsails/lspkind-nvim" })
  use({ "williamboman/nvim-lsp-installer" })
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require("plugins.lsp.null-ls") end }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'


  -- SYNTAX: and LANGUAGES:
  use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
  use { 'NvChad/nvim-colorizer.lua', config = function() require("plugins.syntax.colorizer") end }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' },
    config = function() require("plugins.luasnip") end }
  use({ "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end })
  use({ "preservim/nerdcommenter" })
  use { 'nacro90/numb.nvim', config = function() require('numb') end }

  -- TELESCOPE:
  use({ "nvim-lua/popup.nvim" })
  use { "nvim-lua/plenary.nvim" }
  use({ "nvim-telescope/telescope.nvim" })
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'nvim-pack/nvim-spectre' }
  use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
  use({ "junegunn/fzf.vim" })

  -- TREESITTER:
  use({ "nvim-treesitter/nvim-treesitter", config = function() require("plugins.syntax.treesitter") end })
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
  use({ "m-demare/hlargs.nvim", config = function() require("hlargs").setup() end })
  use { "windwp/nvim-autopairs", after = { 'nvim-treesitter' },
    config = function() require("plugins.syntax.autopairs") end }
  use 'windwp/nvim-ts-autotag'

  -- GIT:
  use { 'kdheepak/lazygit.nvim' }
  use({ "lewis6991/gitsigns.nvim", config = function() require("plugins.git.signs") end })
  -- use { 'github/copilot.vim' } -- if you want to use GitHub Copilot, enable this plugin and run :Copilot setup

  if packer_bootstrap then
    require('packer').sync()
  end
end
})
