local api = vim.api
local lsp = vim.lsp
local util = require("vim.lsp.util")

local lspconfig = require("lspconfig")

local capabilities = lsp.protocol.make_client_capabilities()
local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lsp_installer_ok then
  return nil
end

local handlers = {
  ["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" }),
  ["textDocument/codeAction"] = lsp.with(lsp.buf.code_action(), { border = "rounded" }),
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
  "tailwindcss",
  "tsserver",
  "vuels",
}

lsp_installer.setup({
  ensure_installed = servers,
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
    border = "rounded",
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
})

local formatting_callback = function(client, bufnr)
  vim.keymap.set("n", "<leader>f", function()
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })
end

local on_attach = function(client, bufnr)
  api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...)
    api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
  buf_set_keymap("n", "<leader>h", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
  buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
  buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
  buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", opts) --> formats the current buffer

  formatting_callback(client, bufnr)
end

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach
}

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  })
end
