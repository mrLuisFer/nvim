local enabled = true

require("transparent").setup({
  enable = enabled, -- boolean: enable transparent
  extra_groups = {
    "all",
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
		"BarbarEnable",
  },
  exclude = {}, -- table: groups you don't want to clear
})

vim.g.transparent_enabled = enabled
