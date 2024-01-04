-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }

keyset("n", "+", "<C-a>")
keyset("n", "-", "<C-x>")

-- Select all
keyset("n", "<C-a>", "gg<S-v>G")

-- Tab navigation
keyset("n", "<tab>", ":tabnext<Return>", opts)
keyset("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keyset("n", "ss", ":split<Return>", opts)
keyset("n", "sv", ":split<Return>", opts)

-- Move window depending of the key to be aligned
-- h - j - k - l
keyset("n", "sh", "<C-w>h")
keyset("n", "sj", "<C-w>j")
keyset("n", "sk", "<C-w>k")
keyset("n", "sl", "<C-w>l")

-- Diagnostics
keyset("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Alternative NeoTree plugin keymap, from Vscode
keyset("n", "<C-b>", "<cmd>Neotree toggle<cr>", opts)
