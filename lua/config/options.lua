-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local cmd = vim.cmd
-- Undercurl
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:3m"]])
