-- INIT CONFIG
require('options')
require('mappings')

require("plugins")
require("plugins/colorizer-config")
require("plugins/dashboard-config")
require("plugins/treelua-config")
require("plugins/treesitter-config")
require("plugins/barbar-config")
require('plugins/galaxyline-config')
require('options/themes')

-- LSP Config
require('plugins/lsp-config/completion')
require('plugins/lsp-config/lang-server')
require('plugins/lsp-config/lspsaga')

