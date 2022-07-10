local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
		local bufcmd = vim.api.nvim_buf_create_user_command
		local format = function()
			local params = vim.lsp.util.make_formatting_params({})
			client.request("textDocument/formatting", params, nil, bufnr)
		end

		if client.server_capabilities.documentFormattingProvider then
			bufcmd(bufnr, "NullFormat", format, { desc = "Format using null-ls" })
		end

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					if vim.fn.has("nvim-0.8") == 1 then
						vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
						lsp_formatting(bufnr)
					else
						vim.lsp.buf.formatting_sync()
					end
				end,
			})
		end
	end,
})
