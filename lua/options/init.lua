local set = vim.opt
local g = vim.g
local fn = vim.fn

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.showtabline = 2
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.visualbell = false
set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 3
set.fileencoding = 'utf-8'
set.number = true
set.wildmenu = true
set.completeopt = 'menuone,noselect'
set.title = true
set.showcmd = true
set.hidden = true
set.mouse = "a"
set.ruler = true
set.clipboard = 'unnamed'
set.relativenumber = true
set.cursorline = true

-- Global Plugins variable
g.vim_svelte_plugin_load_full_syntax = 1
-- VSnip Filetypes
g.vsnip_filetypes = {}
g.vsnip_filetypes.javascriptreact = {'javascript'}
g.vsnip_filetypes.typescriptreact = {'typescript'}
g.neoline_disable_tabline = 1

if fn.has('linux') or fn.has('unix') then
  g.python_host_prog = '/usr/bin/python3'
elseif fn.has('win32') or fn.has('win64') then
  -- Please read the documentation and run in a terminal: Whereis.exe python or python3
  -- and add it between the string
	-- DOCUMENTATION: https://github.com/neovim/neovim/wiki/Installing-Neovim
  -- g.python_host_prog = ''
end
