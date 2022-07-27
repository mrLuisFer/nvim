local ls = require("luasnip")

ls.config.set_config({
  history = false,
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved",
})


ls.filetype_extend("javascriptreact", { "html" })
ls.filetype_extend("typescriptreact", { "html" })

require 'luasnip/loaders/from_vscode'.lazy_load({
  paths = { "~/.config/nvim/extra/snippets" },
})

local filetype = vim.bo.filetype
if filetype == "javascriptreact" then
  require("luasnip/loaders/from_vscode").load({ include = { "javascriptreact" } })
  return
end
if filetype == "typescriptreact" then
  require("luasnip/loaders/from_vscode").load({ include = { "typescriptreact" } })
  return
end
