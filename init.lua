pcall(require, "impatient")

-- Init Lua File
require("plugins")

require("options")
require("options.autocmds")
require("options.filetypes")

require("themes")

require("mappings")

require("plugins.lsp")
require("plugins.cmp")
require("plugins.telescope")
