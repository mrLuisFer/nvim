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
require("plugins/coc-config")
require("options/themes")
require("options/coc-extensions")
require("plugins/goto-config")
require("plugins/transparent-config")

-- LSP Config
require("plugins/lsp-config/lang-server")
require("plugins/lsp-config/lspsaga")

