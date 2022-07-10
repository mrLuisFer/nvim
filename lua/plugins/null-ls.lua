local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions
local lsp = vim.lsp
local api = vim.api

local lsp_formatting = function()
	lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		timeout_ms = 2000,
	})
end

local augroup = api.nvim_create_augroup("LspFormatting", {})

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
		local bufcmd = api.nvim_buf_create_user_command
		local format = function()
			local params = lsp.util.make_formatting_params({})
			client.request("textDocument/formatting", params, nil, bufnr)
		end

		if client.server_capabilities.documentFormattingProvider then
			bufcmd(bufnr, "NullFormat", format, { desc = "Format using null-ls" })
		end

		if client.supports_method("textDocument/formatting") then
			api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
					if vim.fn.has("nvim-0.8") == 1 then
						lsp_formatting()
					else
						lsp.buf.formatting_sync(nil, 2000) -- 23 seconds
					end
				end,
			})
		end
	end,
})
