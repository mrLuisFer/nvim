local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Save file using `CTRL-S` or `Space-w`
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<ESC> :w<CR>", opts)

map("n", "<leader>so", ":so%<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

map("n", "<C-x>", ":x<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)

-- Don't yank on delete char
map("n", "x", '"_x', opts)
map("n", "X", '"_X', opts)
map("v", "x", '"_x', opts)
map("v", "X", '"_X', opts)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Prettier
map("n", "<C-p>", ":Prettier<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- or FZF
map("n", "<leader>z", ":FZF<CR>", opts)

-- NVIM Tree Lua
map("n", "<leader>b", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

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

-- LazyGit
-- For use this plugin and keymap you need to have installed lazygit
map('n', '<leader>gg', ':LazyGit<CR>', opts)

-- CoC Mappings
map('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
map('n', ']g', '<Plug>(coc-diagnostic-next)', opts)
-- -- GoTo code navigation.
map('n', 'gd', '<Plug>(coc-definition)', opts)
map('n', 'gy', '<Plug>(coc-type-definition)', opts)
map('n', 'gi', '<Plug>(coc-implementation)', opts)
map('n', 'gr', '<Plug>(coc-references)', opts)

-- Delete word backward
map('n', 'dw', 'vb"_d<CR>', opts)

-- Select all
map('n', '<C-a>', 'gg<S-v>G<CR>', opts)

-- Split window
map('n', 'ss', ':split<Return><C-w>w<CR>', opts)
map('n', 'sv', ':vsplit<Return><C-w>w<CR>', opts)
