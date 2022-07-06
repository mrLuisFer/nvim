local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Custom Mappings
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>so', ':so%<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>x', ':x<CR>', opts)
map('n', '<leader>t', ':terminal<CR>', opts)

-- Prettier
map('n', '<Space>p', ':Prettier<CR>', opts)
-- FZF:
map('n', '<leader>fz', ':FZF<CR>', opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fw', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)

-- Format Files
map('n', '<leader>f', ':Format<CR>',opts)
map('n', '<leader>fr', ':FormatWrite<CR>',opts)
map('n', '<leader>F', ':Neoformat<CR>', opts)

-- NVIM Tree Lua
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
-- Default Tree
map('n', '<C-n>', ':Ntree<CR>', opts)

-- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
-- Select what tab close
-- It doesnt work correctly on Windows
map('n', '<C-w>', ':BufferLinePickClose<CR>', opts)
-- Select for change to the selected tab
map('n', '<C-k>', ':BufferLinePick<CR>', opts)
