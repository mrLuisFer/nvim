pcall(require, "impatient")

-- Init Lua File
require("plugins")

require("options")
require("options.autocmds")
require("options.filetypes")

require("themes")

require("mappings")

require("plugins.syntax.indent")
require("plugins.lsp")
require("plugins.syntax.cmp")
require("plugins.ui.lualine")
require("plugins.telescope")
