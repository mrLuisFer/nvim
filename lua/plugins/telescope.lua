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
	}
}

require("telescope").load_extension "file_browser"
