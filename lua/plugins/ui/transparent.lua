local enabled = true

require("transparent").setup({
  extra_groups = {
    "all",
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
})

vim.g.transparent_enabled = enabled
