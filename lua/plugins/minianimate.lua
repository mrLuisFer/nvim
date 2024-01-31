return {
	"echasnovski/mini.animate",
	event = "VeryLazy",
	opts = function(_, opts)
		if not opts then
			return {}
		end

		opts.scroll = {
			enable = false,
		}
	end,
}
