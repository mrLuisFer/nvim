
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local TREE_WIDTH = 40

local git_icons = {
  unstaged = "",
  staged = "",
  unmerged = "",
  renamed = "➜",
  untracked = "",
  deleted = "",
  ignored = "◌"
}

require'nvim-tree'.setup {
	open_on_setup = false,
  view = {
    width = TREE_WIDTH,
		side = "right",
		signcolumn = "no",
    number = false,
    relativenumber = false
  },
	filters = {
		dotfiles = false
	},
  disable_netrw       = false,
  hijack_netrw        = true,
  ignore_ft_on_setup  = {}, -- will not open on setup if the filetype is in this list
  open_on_tab         = false, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  hijack_cursor       = false, -- hijack the cursor in the tree to put it at the start of the filename
  update_cwd          = true, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  hijack_unnamed_buffer_when_opening = false, -- opens in place of the unnamed buffer if it's empty
  respect_buf_cwd = true, --false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      glyphs = {
        git = git_icons
      }
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      -- if true the tree will resize itself after opening a file
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

nvim_tree_events.on_tree_close(function ()
    bufferline_state.set_offset(0)
end)
