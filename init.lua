-- INIT CONFIG
require('options')
require('mappings')

require("plugins")
require("plugins/colorizer-config")
require("plugins/dashboard-config")
require("plugins/lualine-config")
require("plugins/treelua-config")
require("plugins/treesitter-config")
require("plugins/barbar-config")

-- LSP Config
require('plugins/lsp-config/completion')
require('plugins/lsp-config/lang-server')
require('plugins/lsp-config/lspsaga')
require('plugins/lsp-config/null_ls-config')

