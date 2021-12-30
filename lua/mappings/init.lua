local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
g.mapleader = ' ' -- Space

-- Keymaps
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>so', ':so%<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>x', ':x<CR>', opts)
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', ':DashboardFindFile<CR>', opts)
map('n', '<leader>fw', ':DashboardFindWord<CR>', opts)
map('n', '<F3>', ':Dashboard', opts)

