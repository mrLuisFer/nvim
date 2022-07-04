require('formatter').setup({
	logging = false,
	filetype = {
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						'-assume-filename=',
						vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
						'-style="{BasedOnStyle: Microsoft, UseTab: Always}"'
					},
					stdin = true
				}
			end
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						'-assume-filename=',
						vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
						'-style="{BasedOnStyle: Microsoft, UseTab: Always}"'
					},
					stdin = true
				}
			end
		},

		-- Python
		python = {function() return {exe = "yapf", stdin = true} end},

		-- Javascript
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {'--indent-size 2', '--max-preserve-newlines 3'},
					stdin = true
				}
			end
		},

		-- Lua
		lua = {
			function()
				return {
					args = {'--indent-width 2', '--tab-width 2', '--use-tab'},
					stdin = true
				}
			end
		}
	}
})
