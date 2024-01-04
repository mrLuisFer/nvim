local Util = require("lazyvim.util")

return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
			-- add a keymap to browse plugin files
			-- stylua: ignore
			{
				"<leader>fp",
				function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
				desc = "Find Plugin File",
			},
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    event = "VeryLazy",
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- add fzf itself to wrap the telescope extension
      "junegunn/fzf.vim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        Util.on_load("telescope.nvim", function()
          require("telescope").load_extension("fzf")
        end)
      end,
    },
  },
}
