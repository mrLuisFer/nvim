require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "node_modules", "rgignore", ".ignore" }
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "webp", "pdf" }
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		lazy = {
			theme = "ivy",
			show_icon = true,
			mappings = {
				open_in_browser = "<C-o>",
				open_in_file_browser = "<M-b>",
				open_in_find_files = "<C-f>",
				open_in_live_grep = "<C-g>",
				open_plugins_picker = "<C-b>", -- Works only after having called first another action
				open_lazy_root_find_files = "<C-r>f",
				open_lazy_root_live_grep = "<C-r>g",
			},
		},
	}
}

require("telescope").load_extension "file_browser"
