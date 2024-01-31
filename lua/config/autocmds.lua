-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local api = vim.api

-- Turn of paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Fix conceallevel for json files
api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		local wo = vim.wo
		wo.spell = false
		wo.conceallevel = 0
	end,
})
