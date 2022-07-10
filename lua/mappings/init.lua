local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Custom Mappings
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>so", ":so%<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)
map("n", "<leader>t", ":terminal<CR>", opts)

-- Prettier
map("n", "<C-p>", ":Prettier<CR>", opts)
-- FZF:
map("n", "<leader>fz", ":FZF<CR>", opts)

-- Find files using Telescope command-line sugar.
map("n", "<C-f>", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Format Files
map("n", "<leader>f", ":Format<CR>", opts)
map("n", "<leader>fr", ":FormatWrite<CR>", opts)
map("n", "<leader>F", ":NullFormat<CR>", opts)

-- NVIM Tree Lua
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- Toggle ZenMode
map("n", "<leader>z", ":ZenMode<CR>", opts)

-- Barbar
map("n", "<Tab>", ":BufferNext<CR>", opts)
map("n", "<S-Tab>", ":BufferPrev<CR>", opts)
map("n", "<C-w>", ":BufferClose<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
