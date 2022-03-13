local set = vim.opt
local g = vim.g

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
-- set.backspace = 2
set.showtabline = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.visualbell = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'

set.number = true
set.cursorline = true
set.wildmenu = true
set.completeopt = 'menuone,noselect'
set.title = true

set.showcmd = true
set.hidden = true
set.mouse = "a"
set.ruler = true

set.clipboard = 'unnamed'

g.coc_global_extensions = {'coc-json', 'coc-git', 'coc-css'}

