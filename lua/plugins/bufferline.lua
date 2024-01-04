local buffer_next = "<cmd>BufferLineCycleNext<cr>"
local buffer_prev = "<cmd>BufferLineCyclePrev<cr>"
local buffer_pick_close = "<cmd>BufferlinePickClose<cr>"

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		-- for some reason with tabs it doesnt work correctly in iterm2
		{ "<Tab>",   buffer_next,       desc = "Next tab" },
		{ "<S-Tab>", buffer_prev,       desc = "Prev tab" },
		-- this is an alternative for tab keys
		{ "[b",      buffer_prev,       desc = "Prev buffer" },
		{ "]b",      buffer_next,       desc = "Next buffer" },
		{ "[w",      buffer_pick_close, desc = "Pick close buffer" },
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			-- close current buffer
			right_mouse_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
