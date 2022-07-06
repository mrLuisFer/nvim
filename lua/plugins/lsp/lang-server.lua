local api = vim.api
local lsp = vim.lsp

local lspconfig = require("lspconfig")
local capabilities = lsp.protocol.make_client_capabilities()
local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not lsp_installer_ok then
	return nil
end

local handlers = {
  ["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded"}),
}

local servers = {
	"pyright",
	"emmet_ls",
	"cssls",
	"html",
	"vimls",
	"volar",
	"bashls",
	"graphql",
	"eslint",
	"jsonls",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"vuels"
}

lsp_installer.setup {
	ensure_installed = servers,
	automatic_installation = true,
  ui = {
    icons = {
			server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    },
		border = "rounded"
  },
	keymaps = {
		toggle_server_expand = "<CR>",
    install_server = "i",
    update_server = "u",
    check_server_version = "c",
    update_all_servers = "U",
    check_outdated_servers = "C",
    uninstall_server = "X",
	},
}

-- _ as client
local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
	buf_set_keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts) --> renaname old_fname to new_fname
	buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
	buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", ":lua vim.diagnostic.show()<CR>", opts)
	buf_set_keymap("n", "]d", ":lua vim.diagnostic.show()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts) --> formats the current buffer
end

local tailwindcss = require("plugins.lsp.servers.tailwindcss")
local tsserver = require("plugins.lsp.servers.tsserver")
local eslint = require("plugins.lsp.servers.eslint")
local jsonls = require("plugins.lsp.servers.jsonls")
local sumneko_lua = require("plugins.lsp.servers.sumneko_lua")
local vuels = require('plugins.lsp.servers.vuels')

lspconfig.tailwindcss.setup {
  capabilities = tsserver.capabilities,
  filetypes = tailwindcss.filetypes,
  handlers = handlers,
  init_options = tailwindcss.init_options,
  on_attach = tailwindcss.on_attach,
  settings = tailwindcss.settings,
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = eslint.on_attach,
  settings = eslint.settings,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = jsonls.settings,
}

lspconfig.sumneko_lua.setup {
  handlers = handlers,
  on_attach = on_attach,
  settings = sumneko_lua.settings,
}

lspconfig.vuels.setup {
  filetypes = vuels.filetypes,
  handlers = handlers,
  init_options = vuels.init_options,
  on_attach = on_attach,
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }
end
