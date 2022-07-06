local g = vim.g

require("transparent").setup({
  enable= true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
		"all",
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

g.transparent_enabled = true