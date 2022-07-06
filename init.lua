pcall(require, 'impatient')
-- Init Lua File
require("options")
require("options.themes")
require("options.autocmds")

require("mappings")

require("plugins")
require("plugins.lsp.lang-server")
require("plugins.lsp.lspsaga")

require("plugins.barbar")
require("plugins.bg-transparent")
require("plugins.bufferline")
require("plugins.cmp")
require("plugins.colorizer")
require("plugins.formatter")
require("plugins.indent")
require("plugins.lualine")
require("plugins.luasnip")
require("plugins.telescope")
require("plugins.treelua")
require("plugins.treesitter")
require("plugins.zenmode")

require("plugins.git.signs")
