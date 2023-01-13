pcall(require, "impatient")

-- Init Lua File
require("plugins")

require("options")
require("options.autocmds")
require("options.filetypes")

require("mappings")

require("plugins.lsp")
require("plugins.ui.lualine")
require("plugins.telescope")
require("plugins.syntax.coc-extensions")

require("themes")
