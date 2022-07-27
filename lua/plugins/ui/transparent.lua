require("transparent").setup({
  enable = true, -- boolean: enable transparent
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

vim.g.transparent_enabled = true
