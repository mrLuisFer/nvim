-- Init Lua File
pcall(require, "impatient")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("plugins")

require("options")
require("options.autocmds")
require("options.filetypes")

require("mappings")

require("plugins.lsp")
require("plugins.ui.lualine")
require("plugins.telescope")

require("themes")

-- Custom require plugins
require("autoclose").setup({})
