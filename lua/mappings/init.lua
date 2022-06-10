local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
g.mapleader = ' ' -- Space

-- Custom Mappings
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>so', ':so%<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>x', ':x<CR>', opts)
map('n', '<leader>t', ':terminal<CR>', opts)
map('i', '<C-d>', '<Escape>', opts)

-- Prettier
map('n', '<Space>p', ':Prettier<CR>', opts)

-- Dashboard
map('n', '<leader>ff', ':DashboardFindFile<CR>', opts)
map('n', '<leader>fw', ':DashboardFindWord<CR>', opts)
map('n', '<F3>', ':Dashboard<CR>', opts)

-- NVIM Tree Lua
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
-- Default Tree
map('n', '<C-n>', ':Ntree<CR>', opts)

-- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

