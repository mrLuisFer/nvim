local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- formatters
		formatting.gofmt,
		formatting.goimports,
		formatting.prettier,
		formatting.autopep8,
		formatting.stylua,
		formatting.isort,
		formatting.codespell.with({ filetypes = { "markdown" } }),

		-- diagnostics
		diagnostics.eslint,
		-- actions
		action.eslint,
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
		end
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					if vim.fn.has("nvim-0.8") == 1 then
						vim.lsp.buf.format({
							timeout_ms = 2000, -- 2 seconds
							bufnr = bufnr,
							filter = function()
								return client.name == "null-ls"
							end,
						})
					end
					vim.lsp.buf.formatting_sync(nil, 2000) -- 2 seconds
				end,
			})
		end
	end,
})
