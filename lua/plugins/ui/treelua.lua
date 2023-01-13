vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    width = 60,
    side = "right"
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
