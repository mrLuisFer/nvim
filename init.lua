pcall(require, "impatient")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Init Lua File
require("plugins")

require("options")
require("options.autocmds")
require("options.filetypes")

require("mappings")

require("plugins.lsp")
require("plugins.ui.lualine")
require('plugins.ui.treelua')
require("plugins.telescope")
require("plugins.syntax.coc-extensions")

require("themes")

-- Custom require plugins
require("autoclose").setup({})
