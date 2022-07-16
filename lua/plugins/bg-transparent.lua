local g = vim.g

require("transparent").setup({
  enable= false, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
		"all",
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
		"BarbarEnable"
  },
  exclude = {}, -- table: groups you don't want to clear
})

g.transparent_enabled = false
