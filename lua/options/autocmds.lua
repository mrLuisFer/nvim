local api = vim.api

-- Auto sync plugins on save of plugins.lua
api.nvim_create_autocmd("BufWritePost", { pattern = "plugins.lua", command = "source <afile> | PackerSync" })
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })
-- Disable diagnostics in node_modules (0 is current buffer only)
api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
-- Enable spell checking for certain file types
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell" })
-- Winbar (for nvim 0.8+)
if vim.fn.has('nvim-0.8') == 1 then
  api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
    callback = function()
      local winbar_filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "TelescopePrompt",
        "DressingInput",
        "DressingSelect",
        "neotest-summary",
      }

      if (api.nvim_win_get_config(0).relative ~= "") then
        return
      end

      if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt_local.winbar = nil
        return
      end

      if vim.bo.filetype == 'GitBlame' then
        local hl_group = "Secondary"
        vim.opt_local.winbar = " " .. "%#" .. hl_group .. "#" .. require('icons').git .. "Blame" .. "%*"
        return
      end

      local present, winbar = pcall(require, "winbar")
      if not present or type(winbar) == "boolean" then
        vim.opt_local.winbar = nil
        return
      end

      vim.opt_local.winbar = winbar.filename()
    end,
  })
end
